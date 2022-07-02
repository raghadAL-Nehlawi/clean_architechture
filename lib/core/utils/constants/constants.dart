import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

///
///
/// The [Endpoints] class is a way to separate the API's endpoints and base url from the remote data sources classes
/// and put them in one easy to edit class
///
/// 1- static and const values which are:
///
/// * [Endpoints.BASE_URL] the base url of the backend system we are working with
///
///
///
class Endpoints {
  static const BASE_URL = 'https://osoul.futurecode.shop/api/';
  static const LOGIN_URL = 'login';
  static const SIGN_UP = 'sign_up';
}

///
/// The [ErrorCode] enum is responsible of stating all the possible issues that can be retrieved from the API
///
/// Values:
///
/// * [ErrorCode.SERVER_ERROR] indicates that the server returned an undefined error
/// * [ErrorCode.WRONG_INPUT] returned when the server returns error 422 UnProcessable Entity
/// * [ErrorCode.NO_INTERNET_CONNECTION] returned when the device is not connected to a network
/// * [ErrorCode.FORBIDDEN] returned when the server returns 403 Forbidden
/// * [ErrorCode.TIMEOUT] returned when the request has timed out
/// * [ErrorCode.UNAUTHENTICATED] returned when the request returns that the user is unauthenticated
///
enum ErrorCode {
  SERVER_ERROR,
  UNAUTHENTICATED,
  TIMEOUT,
  NO_INTERNET_CONNECTION,
  WRONG_INPUT,
  PARSE_ERROR,
  FORBIDDEN,
  NOT_VERIFIED,
  REGISTERED_EMAIL,
  IDENTIFIER_TAKEN
}

///
/// [GetOptions] class is for gathering all the options for the [Dio] package in one class
///
class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String token, {String language = ''}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
        'Accept-Language': language,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': language,
      };
    }
    return options;
  }
}

class GetParams {
  static Map<String, dynamic> getLoginParams(String phone, String password,int remember ) {
    return {
      'phone': phone,
      'password': password,
      'remember': remember
    };
  }

  static Map<String, dynamic> getSignUpParams(
      String email, String phone, String name, String password) {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'password': password
    };
  }
}

BehaviorSubject<AppLanguage> languageSubject = BehaviorSubject();

void changeGlobalAppLanguage(AppLanguage language) {
  languageSubject.add(language);
}

///
///
/// [AppLanguage] enum is declaring the supported languages in our app
///
enum AppLanguage {
  AR,
  EN,
}

class FlushBarUtil {
  static showSuccessFlushBar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.done,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF73C9E2),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  static showErrorFlushBar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFFEF4874),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
