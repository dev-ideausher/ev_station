import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lister_profile_controller.dart';

class ListerProfileView extends GetView<ListerProfileController> {
  const ListerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListerProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListerProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
