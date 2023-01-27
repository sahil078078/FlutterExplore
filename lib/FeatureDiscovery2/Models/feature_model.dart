import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/FeatureDiscovery2/feature_id_const.dart';

class FeatureModel {
  final String featureID;
  final Widget tapTarget;
  final Color backgroundColor;
  final Widget description;
  final Color targetColor;
  final Color textColor;

  FeatureModel({
    required this.featureID,
    required this.tapTarget,
    required this.backgroundColor,
    required this.description,
    required this.targetColor,
    required this.textColor,
  });
}

List<FeatureModel> featureList = [
  FeatureModel(
    featureID: FeatureIDConst.featureID1,
    tapTarget: const Icon(Icons.menu),
    backgroundColor: Colors.brown.shade200,
    description: const Text(
        "With this you can open drawer inside drawer you will get following\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
    targetColor: Colors.orange.shade100,
    textColor: Colors.white,
  ),
  FeatureModel(
    featureID: FeatureIDConst.featureID2,
    tapTarget: const Icon(Icons.search),
    backgroundColor: Colors.green.shade100,
    description: const Text(
        "With this you can open search bar and follow this\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
    targetColor: Colors.orangeAccent.shade200,
    textColor: Colors.brown,
  ),
];
