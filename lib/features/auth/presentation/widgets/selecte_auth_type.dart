import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/constants/enums.dart';
import '../getx/auth_controller.dart';

class SelectAuthType extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        decoration:  BoxDecoration(color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        padding: EdgeInsets.all(8),
        width: Get.width,
        height: 56,
        child: controller.authType == AuthType.login?
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                ),
                width: (Get.width - 80) / 2,
                child: Center(child: Text("login".tr,style: AppTextStyle.mediumSecondaryWithoutOpacityStyle,)),
              ),
              InkWell(
                onTap: (){
                  controller.authType.value = AuthType.signup;},
                child: Container(
                    alignment: Alignment.center,
                    width: (Get.width - 150) / 2,
                    child: Text("signup".tr, style: AppTextStyle.largeDarkStyle)),
              )
            ]):
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               InkWell(
                 onTap: (){controller.authType.value = AuthType.login;},
                 child: Container(
                   alignment: Alignment.center,
                     width: (Get.width - 150) / 2,
                     child: Text("login".tr, style: AppTextStyle.largeDarkStyle)),
               ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                ),
                width: (Get.width - 80) / 2,
                child: Center(child: Text("signup".tr,style: AppTextStyle.mediumSecondaryWithoutOpacityStyle,)),
              ),
        ]),
      ),
    );
  }
}
