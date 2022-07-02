
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../../features/auth/presentation/auth.dart';
import '../../../features/auth/presentation/getx/auth_binding.dart';
import '../../../features/home/presentation/pages/getx/home_binding.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/splash/prsentation/getx/splash_binding.dart';
import '../../../features/splash/prsentation/splash.dart';
import 'generate_screen.dart';

class AppPages {
  List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.SPLASH_PAGE, page: () => SplashPage(), binding: SplashBinding()),
      GetPage(name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
      GetPage(name: AppRoutes.LOGIN_PAGE, page: () => AuthPage(), binding: AuthBinding()),


    ];
  }


  String getInitPage(){
  return AppRoutes.SPLASH_PAGE;
  }



}
