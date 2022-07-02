import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../error/error_handler.dart';
import '../../error/exceptions.dart';
import '../../utils/constants/constants.dart';

///
///
/// The [BaseRemoteDataSource] has the basic functions that each remote data source must have.
///
/// Each remote data source interface must extend from this interface
///

abstract class BaseRemoteDataSource {
  ///
  /// This function performs a PUT http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<T> performPutRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    FormData? data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequestJSON<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> data, {
    String token = '',
  });

  ///
  /// This function performs a POST http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  Future<T> performPostRequest<T>(
    String endpoint,
    Map<String, dynamic> data,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
  });

  ///
  /// This function performs a GET http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [List] of [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<List<T>> performGetListRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
  });

  ///
  /// This function performs a GET http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<T> performGetRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
  });
}

///
/// The [BaseRemoteDataSourceImpl] has the implementation of the basic functions that each remote data source must have.
///
/// Each remote data source class must extend from this class and implement a sub-interface of [BaseRemoteDataSource] interface.
///
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<T> performGetRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response status code is ${response.statusCode}');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse = fromJson(json.decode(response.data));

        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioError) {
        ErrorHandler.handleRemoteError(e.response!.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<List<T>> performGetListRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final List<T> list = [];
        final data = json.decode(response.data) as List;
        for (var element in data) {
          print('element is null ${element == null}');
          if (element == null)
            continue;
          list.add(fromJson(element));
        }
        return list;
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('get list e is $e');
      if (e is ServerException) {
        print(e.errorCode);
        throw e;
      }
      if (e is DioError) {
        print('e is DioError');
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPostRequest<T>(String endpoint, Map<String, dynamic>? data,
      T Function(Map<String, dynamic>) fromJson,
      {String token = ''}) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        print("BLAAAA " + json.decode(response.data)["data"].toString());
        final baseResponse = fromJson(json.decode(response.data)["data"]);

        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('eee is $e');
      if (e is ServerException) throw e;
      if (e is DioError) {
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPutRequest<T>(String endpoint,
      T Function(Map<String, dynamic>) fromJson, Map<String, dynamic>? data,
      {String token = ''}) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse = fromJson(json.decode(response.data));
        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print('eee is $e');
      if (e is ServerException) throw e;
      if (e is DioError) {
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPatchRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    FormData? data, {
    String token = '',
  }) async {
    print('data in form data is ${data!.fields}');
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      print('response is $response');
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        if (T.toString() == 'String') {
          return 'Success' as T;
        }
        final baseResponse = fromJson(json.decode(response.data));
        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioError) {
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }

  @override
  Future<T> performPatchRequestJSON<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? data, {
    String token = '',
  }) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response.statusCode!)) {
        final baseResponse = fromJson(json.decode(response.data));
        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException) throw e;
      if (e is DioError) {
        ErrorHandler.handleRemoteError(e.response?.statusCode ?? 404);
        throw e;
      } else {
        throw ServerException(ErrorCode.SERVER_ERROR);
      }
    }
  }
}
