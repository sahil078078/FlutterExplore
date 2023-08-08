import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/FeatureDiscovery2/Models/feature_model.dart';
import 'package:flutter_explore/FeatureDiscovery2/feature_id_const.dart';

class FeatureDiscoveryHome2 extends StatelessWidget {
  const FeatureDiscoveryHome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeatureDiscovery(
        child: const FeatureDiscoveryPage2(),
      ),
    );
  }
}

class FeatureDiscoveryPage2 extends StatefulWidget {
  const FeatureDiscoveryPage2({Key? key}) : super(key: key);

  @override
  State<FeatureDiscoveryPage2> createState() => _FeatureDiscoveryPage2State();
}

class _FeatureDiscoveryPage2State extends State<FeatureDiscoveryPage2> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(
        context,
        <String>[
          FeatureIDConst.featureID1,
          FeatureIDConst.featureID2,
          FeatureIDConst.featureID3,
          FeatureIDConst.featureID4,
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: DescribedFeatureOverlay(
          featureId: featureList.elementAt(0).featureID,
          tapTarget: featureList.elementAt(0).tapTarget,
          backgroundColor: featureList.elementAt(0).backgroundColor,
          targetColor: featureList.elementAt(0).targetColor,
          textColor: featureList.elementAt(0).textColor,
          description: featureList.elementAt(0).description,
          child: const Icon(Icons.menu),
        ),
        actions: [
          DescribedFeatureOverlay(
            featureId: featureList.elementAt(1).featureID,
            tapTarget: featureList.elementAt(1).tapTarget,
            backgroundColor: featureList.elementAt(1).backgroundColor,
            targetColor: featureList.elementAt(1).targetColor,
            textColor: featureList.elementAt(1).textColor,
            description: featureList.elementAt(1).description,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Column(),
    );
  }
}
