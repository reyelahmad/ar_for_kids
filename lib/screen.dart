import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class AR_Screen extends StatefulWidget {
  const AR_Screen({super.key});

  @override
  State<AR_Screen> createState() => _AR_ScreenState();
}

class _AR_ScreenState extends State<AR_Screen> {
  ArCoreController? coreController;

  augmentedRealityViewCreated(ArCoreController controller) {
    coreController = controller;

    displayCube(coreController!);
  }

  displayCube(ArCoreController controller) {
    final materials = ArCoreMaterial(
      color: Colors.amber,
      metallic: 2,
    );

    final cube = ArCoreCube, materials: [materials]);

    final node = ArCoreNode(
      shape: cube,
      position: vector64.Vector3(-0.5, 0.5, -3.5),
    );
    
    coreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New AR"),
      ),
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityViewCreated,
      ),
    );
  }
}
