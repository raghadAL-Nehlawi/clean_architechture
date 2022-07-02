import 'package:get/get.dart';

import '../../../../core/presentation/widgets/app_text_field.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.create(() => AppTextFieldController());
    Get.create(() => AppTextFieldController());
    Get.create(() => AppTextFieldController());
  }

}