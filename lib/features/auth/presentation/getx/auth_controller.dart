import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/presentation/snack_bar/snack_bar.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/routes/generate_screen.dart';
import '../../../../injection.dart';
import '../../domain/entity/user.dart';
import '../../domain/usecase/login.dart';
import '../../domain/usecase/signup.dart';
import '../../domain/validater/auth_input_validators.dart';

class AuthController extends GetxController{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool rememberMe = false.obs;
  Rx<AuthType> authType = AuthType.login.obs;

  late final AuthInputValidators authInputValidators;
  late final Login login;
  late final SignUp signUp;

  onLogin()async{
    try {
    //  Get.offAllNamed(AppRoutes.ESTATE_TYPE);
      if(phone.text.length < 9)
        Utils.openSnackBar(message: "invalidPhone".tr);
      else if(password.text.length == 0)
        Utils.openSnackBar(message: "passwordShouldNotBeEmpty".tr);
      else{
        Utils.openLoadingDialog();
        Either<Failure, User> response = await  login.call(
                                          LoginParams(
                                              phone: phone.text,
                                              password: password.text,
                                              remember: rememberMe.value == false ?0 : 1
                                          ),);
        response.fold(
                (l){
                  Get.back();
              Utils.openSnackBar(message:  l.toString());
            },
                (r) {
                  Get.back();
                  Get.offAllNamed(AppRoutes.HOME);
            });
      }

    }catch(err){
      Get.back();
      Utils.openSnackBar(message: err.toString());
     print(err);
    }finally{
      //
    }


  }

  @override
  onInit(){

    login =  sl<Login>();
   // authInputValidators = Get.find<AuthInputValidators>();
    super.onInit();
  }







}