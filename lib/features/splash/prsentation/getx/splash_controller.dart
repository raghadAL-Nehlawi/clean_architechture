import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/routes/generate_screen.dart';
import '../../../../injection.dart';
import '../../domain/usecase/is_logged_in.dart';

class SplashController extends GetxController{
  String app_name = 'Real Estate';
  late final IsLoggedIn isLoggedIn;




  @override
    onInit() async {
    isLoggedIn = sl();
    Future.delayed(const Duration(seconds: 5), () async{
      Either<Failure, bool> response = await isLoggedIn(IsLoggedInParams());
      response.fold(
              (l) => Get.toNamed(AppRoutes.LOGIN_PAGE),
              (r) => Get.toNamed(AppRoutes.HOME));

    });
  }

}