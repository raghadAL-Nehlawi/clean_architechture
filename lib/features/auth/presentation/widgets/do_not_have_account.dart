import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:get/get.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/constants/enums.dart';
import '../getx/auth_controller.dart';


class DoNotHaveAccount extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.authType.value = AuthType.signup;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('dontHaveAccount?'.tr ,style: AppTextStyle.mediumSecondaryWithoutOpacityStyle),
            SvgPicture.asset("assets/icons/back.svg",color: Theme.of(context).primaryColorDark.withOpacity(0.5))
          ],
        ),
      ),
    );
  }
}
