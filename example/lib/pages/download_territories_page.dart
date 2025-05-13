import 'package:dgis_mobile_sdk_full/dgis.dart' as sdk;
import 'package:flutter/material.dart';

import 'common.dart';

class DownloadTerritoriesPage extends StatefulWidget {
  const DownloadTerritoriesPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<DownloadTerritoriesPage> createState() =>
      _DownloadTerritoriesPageState();
}

class _DownloadTerritoriesPageState extends State<DownloadTerritoriesPage> {
  final formKey = GlobalKey<FormState>();
  late sdk.SearchManager searchManager;
  late sdk.TerritoryManager territoryManager;
  late sdk.LocationService locationService;

  List<sdk.Territory> territories = [];
  List<sdk.Territory> filteredTerritories = [];
  Map<String, double> progressMap = {};
  String filter = '';
  final TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void updateFilter(String value) {
    setState(() {
      filter = value;
      filteredTerritories = territories.where((territory) {
        return territory.info.name.toLowerCase().contains(filter.toLowerCase());
      }).toList();
    });
  }

  void clearFilter() {
    filterController.clear();
    updateFilter('');
  }

  String formatSize(int sizeInBytes) {
    return (sizeInBytes / (1024 * 1024)).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: filterController,
              onChanged: updateFilter,
              decoration: InputDecoration(
                labelText: 'Filter Territories',
                border: const OutlineInputBorder(),
                suffixIcon: filter.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: clearFilter,
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTerritories.length,
              itemBuilder: (context, index) {
                final territory = filteredTerritories[index];
                final progress = progressMap[territory.info.name] ?? 0.0;

                return ListTile(
                  title: Text(territory.info.name),
                  subtitle: Text(
                    progress > 0 && progress < 100
                        ? 'Installing: ${progress.toInt()}%'
                        : territory.info.installed
                            ? 'Installed (${formatSize(territory.info.finalSizeOnDisk!)} MB)'
                            : 'Not installed',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!territory.info.installed && progress == 0.0)
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () async {
                            setState(() {
                              progressMap[territory.info.name] = 1.0;
                            });
                            territory.install();
                            territory.progressChannel.listen((progress) {
                              setState(() {
                                progressMap[territory.info.name] =
                                    progress.toDouble();
                              });

                              if (progress == 100) {
                                setState(() {
                                  progressMap.remove(territory.info.name);
                                });
                              }
                            });
                          },
                        ),
                      if (progress > 0.0 && progress < 100.0)
                        SizedBox(
                          width: 100,
                          child: LinearProgressIndicator(
                            value: progress / 100,
                          ),
                        ),
                      if (territory.info.installed)
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            territory.uninstall();
                            setState(() {
                              progressMap.remove(territory.info.name);
                            });
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initialize() async {
    final context = AppContainer().initializeSdk();
    territoryManager = sdk.getTerritoryManager(context);

    territoryManager.territoriesChannel.listen((territoriesList) {
      setState(() {
        territories = List.from(territoriesList);
        filteredTerritories = territories;
        territories.sort((a, b) {
          if (a.info.installed && !b.info.installed) {
            return -1;
          } else if (!a.info.installed && b.info.installed) {
            return 1;
          } else {
            return a.info.name.compareTo(b.info.name);
          }
        });
      });
    });

// офис 2gis
    final geoPoint = sdk.GeoPoint(
      latitude: sdk.Latitude(55.736206),
      longitude: sdk.Longitude(37.531660),
    );

  try {
    print("Find territories!");
    var territories = territoryManager.findByPoint(geoPoint);
    print("Territories count: ${territories.length}");
  } catch (e) {
    print("Find territory exception: $e");
  }
  }
}

