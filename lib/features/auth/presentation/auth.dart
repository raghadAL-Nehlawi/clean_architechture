
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/presentation/widgets/app_button.dart';
import '../../../core/presentation/widgets/app_text_field.dart';
import '../../../core/presentation/widgets/logo.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/light_theme_colors.dart';
import 'getx/auth_controller.dart';


class AuthPage extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 100,bottom: 40 ),
                    child: Logo(),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      alignment: AlignmentDirectional.centerStart,
                      /*decoration: BoxDecoration(
                          border: Border.all(color:  Color(0xFFF3F3F3)),
                          color:Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(20)
                      ),*/
                      child: Text("login".tr, style:  TextStyle( color: Theme.of(context).primaryColor,fontSize: 24, fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 20,width: 2,),
                  controller.authType.value == AuthType.signup?
                    Padding(
                      padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
                      child: AppTextField(
                        'name'.tr,
                        textController: controller.name,
                        prefixIcon: Icon(Icons.person, color: LightThemeColors.textDarkColor ,),),
                    ): SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
                    child: AppTextField(
                        'phone'.tr,
                        textController: controller.phone,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset('assets/icons/phone.svg'),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
                    child: AppTextField(
                        "password".tr,
                        textController: controller.password,
                        prefixIcon:  Container(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset('assets/icons/password.svg'),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){
                              controller.rememberMe.toggle();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  controller.rememberMe.value?Icons.check_circle:Icons.check_circle_outline,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                SizedBox(height: 10,width: 10,),
                                Text("rememberMe".tr,style: TextStyle(color: Theme.of(context).primaryColor),),
                              ],
                            )
                        ),
                        InkWell(
                            onTap: (){},
                            child: Text("forgetPassword".tr,style: TextStyle(color: Theme.of(context).primaryColor),)
                        ),

                      ],
                    ),
                  )

                ]),
          ),
          bottomNavigationBar:   Padding(
            padding: const EdgeInsets.only(bottom:  70),
            child: AppButton(text: "continue".tr,onTap: () => controller.onLogin() ,),
          )

        ),
      ),
    );
  }
}


