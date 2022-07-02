import 'dart:convert';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../../../../core/data/model/base_local_data_source.dart';
import '../../../../core/data/shared_preferences_keys.dart';
import '../model/user_model.dart';

abstract class AuthLocalDataSource extends BaseLocalDataSourceImpl{
  AuthLocalDataSource({required super.sharedPreferences});

  Future<void> loginUser(
      UserModel userModel,
      String token,
      String? rememberMeToken
      );





}

class AuthLocalDataSourceImp extends AuthLocalDataSource{
  AuthLocalDataSourceImp({
    required RxSharedPreferences sharedPreferences,
  }) : super(
    sharedPreferences: sharedPreferences,
  );

  @override
  Future<void> loginUser(
      UserModel userModel, String token,String? rememberMeToken) async {
    print('login user inside login local datasource');
    sharedPreferences.setString(
      SharedPreferencesKeys.USER,
      json.encode(userModel.toJson()),
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.TOKEN,
       token,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.REFRESH_TOKEN,
      rememberMeToken,
    );
    sharedPreferences.setBool(
      SharedPreferencesKeys.IS_LOGGED_IN,
      true,
    );
    print(sharedPreferences.getString(SharedPreferencesKeys.TOKEN));
  }


}