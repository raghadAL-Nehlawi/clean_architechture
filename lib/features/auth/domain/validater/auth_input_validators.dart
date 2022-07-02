import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

///
///
/// [LoginValidators] is responsible for validating all the data entered in the login page.
///
/// Functions:
///   [validateEmailInput]: Uses regular expressions in order to validate the email
///   the regular expression used is the (General Email Regex (RFC 5322 Official Standard))
///   Resource: https://html.spec.whatwg.org/multipage/input.html#e-mail-state-%28type=email%29
///
///
///   [validatePasswordInput]: Only validates that the password is more than 8 characters long
///
class AuthInputValidators {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9_-]+\.[a-zA-Z]+");

  Either<Failure, String> validateEmailInput(String email) {
    if (emailRegExp.hasMatch(email)) {
      return Right(email);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validatePasswordInput(String password) {
    if (password.length >= 8)
      return Right(password);
    else
      return Left(InvalidInputFailure());
  }
}

class InvalidInputFailure extends Failure {}
