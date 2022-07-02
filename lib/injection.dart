import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/data/model/base_local_data_source.dart';
import 'core/data/model/base_remote_datasource.dart';
import 'core/data/repository/base_repository.dart';
import 'core/network/network_info.dart';
import 'core/utils/constants/constants.dart';
import 'features/auth/data/data_source/auth_local_data_sources.dart';
import 'features/auth/data/data_source/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_imp.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecase/login.dart';
import 'features/auth/domain/validater/auth_input_validators.dart';
import 'features/splash/data/data_source/splash_local_data_source.dart';
import 'features/splash/data/repository/splash_repository_impl.dart';
import 'features/splash/domain/repository/splash_repository.dart';
import 'features/splash/domain/usecase/is_logged_in.dart';


final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //! External

  /// Adding the [SharedPreferences] instance to the graph to be later used by the local data sources
  final sharedPreferences = await SharedPreferences.getInstance();
  final rxPrefs = RxSharedPreferences(sharedPreferences,
      kReleaseMode ? null : RxSharedPreferencesDefaultLogger());

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => rxPrefs);

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 20000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
      return dio;
    },
  );

  /// Adding the [DataConnectionChecker] instance to the graph to be later used by the [NetworkInfoImpl]
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Core
  ///Creating [NetworkInfoImpl] class
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  /// Instantiating the [BaseRemoteDataSourceImpl]
  sl.registerLazySingleton<BaseRemoteDataSource>(
    () => BaseRemoteDataSourceImpl(dio: sl()),
  );

  /// Instantiating the [BaseLocalDataSourceImpl]
  sl.registerLazySingleton<BaseLocalDataSource>(
    () => BaseLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );



  // Repository
  /// Instantiating the [BaseRepositoryImpl]
  sl.registerLazySingleton<BaseRepository>(
    () => BaseRepositoryImpl(
      networkInfo: sl(),
      baseLocalDataSource: sl(),
      baseRemoteDataSource: sl(),
    ),
  );

  /// Instantiating the [AuthRepository]
  sl.registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(
      dio: sl()
    ),
  );

  /// Instantiating the [AuthRepository]
  sl.registerFactory<SplashLocalDataSource>(
        () => SplashLocalDataSourceImpl(
        sharedPreferences: sl()
    ),
  );


  /// Instantiating the [AuthRepository]
  sl.registerFactory<AuthLocalDataSource>(
        () => AuthLocalDataSourceImp(
            sharedPreferences: sl()
    ),
  );

  /// Instantiating the [SplashRepository]
  sl.registerFactory<SplashRepository>(
        () => SplashRepositoryImpl(
          networkInfo: sl(),
          splashLocalDataSource: sl(),
  ),
  );

  /// Instantiating the [AuthRepository]
  sl.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(
            networkInfo: sl(),
            authLocalDataSource: sl(),
            authRemoteDataSource: sl()
    ),
  );

  /// Instantiating the [AuthInputValidators]
  sl.registerFactory<AuthInputValidators>(
        () => AuthInputValidators(),
  );

  /// Instantiating the [SPLASH]
  sl.registerFactory<IsLoggedIn>(
        () => IsLoggedIn(
      repository: sl(),
    ),
  );
  /// Instantiating the [Login]
  sl.registerFactory<Login>(
        () => Login(
      repository: sl(),
    ),
  );



}
