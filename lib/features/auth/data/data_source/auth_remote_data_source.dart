
import '../../../../core/data/model/base_remote_datasource.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../domain/entity/login_entity.dart';
import '../model/login_response.dart';







abstract class AuthRemoteDataSource extends BaseRemoteDataSourceImpl{
  AuthRemoteDataSource({required super.dio});

  Future<AuthResponse> loginUser(String email, String password,int remember);

  Future<AuthResponse> signUpUser (String email, String phone, String name, String password);
}



class AuthRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements AuthRemoteDataSource{
  AuthRemoteDataSourceImp({required super.dio});

  @override
  Future<AuthResponse> loginUser(String phone, String password,int remember)async {
   final response = await performPostRequest<LoginResponseModel>(
    Endpoints.LOGIN_URL,
    GetParams.getLoginParams(phone, password,remember),
    LoginResponseModel.fromJson,
    );
    print(response);
    return response;
  }

  @override
  Future<AuthResponse> signUpUser(String email, String phone, String name, String password)async {
    final response = await performPostRequest<LoginResponseModel>(
      Endpoints.SIGN_UP,
      GetParams.getSignUpParams(email, phone, name, password),
      LoginResponseModel.fromJson,
    );
    print(response);
    return response;
  }

}

