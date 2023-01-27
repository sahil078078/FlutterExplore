import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'feature_discovery_page.dart';

class FeatureDiscoveryHome extends StatelessWidget {
  const FeatureDiscoveryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //To be able to work with any of the global functions provided by the feature_discovery package,
    // you will have to wrap your widget tree in a FeatureDiscovery widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureDiscovery(
        child: const FeatureDiscoveryPage(),
      ),
    );
  }
}


