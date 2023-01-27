import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeatureDiscoveryPage extends StatefulWidget {
  const FeatureDiscoveryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FeatureDiscoveryPage> createState() => _FeatureDiscoveryPageState();
}

class _FeatureDiscoveryPageState extends State<FeatureDiscoveryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // we have to initilize featureIDs here
      FeatureDiscovery.discoverFeatures(
        context,
        <String>[
          "futureID1",
          "futureID2",
          "futureID3",
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        leading: DescribedFeatureOverlay(
          featureId: "futureID1", //Unique id that identifies this overlay.
          tapTarget: const Icon(
              Icons.menu), //The widget that will be displayed as the tap target
          backgroundColor: Colors.orange.shade200,
          description: const Text(
            'Here drawer will open it have setting and download functionality',
          ),
          targetColor: Colors.white,
          textColor: Colors.white,
          contentLocation: ContentLocation.trivial,
          title: const Text("This is Button"),
          pulseDuration: const Duration(seconds: 2),
          enablePulsingAnimation: true,
          overflowMode: OverflowMode.extendBackground,
          openDuration: const Duration(seconds: 1),

          onOpen: () async {
            return true;
          },
          child: IconButton(
            onPressed: () async {
              debugPrint("drawerOpen");
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          DescribedFeatureOverlay(
            featureId: "futureID2", //Unique id that identifies this overlay.
            tapTarget: const Icon(Icons
                .search), //The widget that will be displayed as the tap target
            backgroundColor: Colors.orange.shade200,
            description: const Text(
              'You can search here',
            ),
            targetColor: Colors.white,
            textColor: Colors.white,
            contentLocation: ContentLocation.trivial,
            title: const Text("This search buttom"),
            pulseDuration: const Duration(seconds: 2),
            enablePulsingAnimation: true,
            overflowMode: OverflowMode.extendBackground,
            openDuration: const Duration(seconds: 1),

            onOpen: () async {
              return true;
            },
            child: IconButton(
              onPressed: () async {
                debugPrint("Search here");
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            DescribedFeatureOverlay(
              featureId: "futureID3", //Unique id that identifies this overlay.
              tapTarget: const Icon(Icons
                  .add), //The widget that will be displayed as the tap target
              backgroundColor: Colors.orangeAccent.shade200,
              description: const Text(
                'You can add increment by pressing buttom',
              ),
              targetColor: Colors.white,
              textColor: Colors.white,
              contentLocation: ContentLocation.below,
              title: const Text("This is Button3"),
              pulseDuration: const Duration(seconds: 1),
              enablePulsingAnimation: true,
              overflowMode: OverflowMode.wrapBackground,
              openDuration: const Duration(seconds: 1),

              onOpen: () async {
                return true;
              },
              child: IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
