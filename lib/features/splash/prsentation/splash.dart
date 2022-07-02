import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/presentation/widgets/logo.dart';
import 'getx/splash_controller.dart';




class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.app_name;
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100, width: 10,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset("assets/images/splash.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
