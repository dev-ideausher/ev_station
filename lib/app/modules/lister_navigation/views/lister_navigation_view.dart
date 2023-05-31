import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lister_navigation_controller.dart';

class ListerNavigationView extends GetView<ListerNavigationController> {
  const ListerNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListerNavigationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListerNavigationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
