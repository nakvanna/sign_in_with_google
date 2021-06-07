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
        child: MaterialButton(
          elevation: 10,
          onPressed: () => controller.googleSignIn(),
          color: Colors.indigoAccent,
          splashColor: Colors.purple,
          child: Text('Google Sign IN'),
        ),
      ),
    );
  }
}
