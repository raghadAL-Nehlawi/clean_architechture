import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/routes/app_pages.dart';
import 'core/utils/routes/generate_screen.dart';
import 'core/utils/light_theme_colors.dart';
import 'core/utils/localization_service.dart';
import 'features/splash/prsentation/getx/splash_binding.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  void initState() {
    //bloc.screenAppeared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
        return  GetMaterialApp(
          title: "Real Estate",
          initialBinding: SplashBinding(),
          initialRoute: AppRoutes.SPLASH_PAGE,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          locale: LocalizationService.locales[1],
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          getPages: AppPages().getPages(),
          theme: Theme.of(context).copyWith(
          backgroundColor: LightThemeColors.backgroundColor,
            scaffoldBackgroundColor: LightThemeColors.backgroundColor,
          primaryColor: LightThemeColors.primaryColor,
          secondaryHeaderColor: LightThemeColors.secondaryHeaderColor,
          primaryColorDark: LightThemeColors.textDarkColor,
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: "Sora",
          ),
          indicatorColor: LightThemeColors.primaryColor,
        ),

        );
  }
}
