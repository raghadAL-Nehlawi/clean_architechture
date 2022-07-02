
import 'package:clean_architechture/features/home/presentation/pages/widgets/estate_widget.dart';
import 'package:clean_architechture/features/home/presentation/pages/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx/home_controller.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HomePageHeader(),
            Container(
              width: Get.width,
              height: 280,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                  itemCount: controller.estates.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(_,index) => EstateWidget(estate: controller.estates[index])),
            )
          ],
        ),

      ),
    );
  }
}
