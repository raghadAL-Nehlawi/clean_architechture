import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import '../../../../core/data/model/base_local_data_source.dart';
import '../../../../core/data/shared_preferences_keys.dart';


///
///
/// The [SplashLocalDataSource] interface declares all the interactions between the splash feature and the local data source
/// extends from the [BaseLocalDataSource]
///
abstract class SplashLocalDataSource extends BaseLocalDataSource {
  Future<bool?> get isLoggedIn;
}

///
///
/// The [SplashLocalDataSourceImpl] class has all the interactions between the splash feature and the local data source
/// extends from the [BaseLocalDataSourceImpl]
///
class SplashLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SplashLocalDataSource {
  final RxSharedPreferences sharedPreferences;

  SplashLocalDataSourceImpl({required this.sharedPreferences})
      : super(
          sharedPreferences: sharedPreferences,
        );

  @override
  Future<bool?> get isLoggedIn => Future.value(
      sharedPreferences.getBool(SharedPreferencesKeys.IS_LOGGED_IN));

}
