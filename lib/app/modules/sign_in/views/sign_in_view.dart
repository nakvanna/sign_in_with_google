import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              elevation: 10,
              onPressed: () => controller.isNotLogin
                  ? controller.googleSignIn()
                  : controller.googleSignOut(),
              color: controller.isNotLogin ? Colors.indigoAccent : Colors.red,
              splashColor: Colors.purple,
              child: Text(
                controller.isNotLogin ? 'Google Sign IN' : 'Google Sign Out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
