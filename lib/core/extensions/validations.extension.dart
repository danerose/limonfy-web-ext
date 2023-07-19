import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/core/constants/regex.constants.dart';

extension EmailValidationExt on String {
  EmailValidationEnum get isValidEmail {
    if (this == '') {
      return EmailValidationEnum.empty;
    } else {
      return RegexConstants.email.hasMatch(this)
          ? EmailValidationEnum.valid
          : EmailValidationEnum.invalid;
    }
  }
}

extension NameValidationExt on String {
  NameValidationEnum get isValidName {
    if (this == '') {
      return NameValidationEnum.empty;
    } else {
      return NameValidationEnum.valid;
    }
  }
}

extension UserNameValidationExt on String? {
  UserNameValidationEnum get isValidUsername {
    if (this == null || this == '') {
      return UserNameValidationEnum.empty;
    } else if (!RegexConstants.username.hasMatch(this!)) {
      return UserNameValidationEnum.invalid;
    } else {
      return UserNameValidationEnum.valid;
    }
  }
}

extension UrlValidationExt on String {
  UrlValidationEnum get isValidUrl {
    if (this == '') {
      return UrlValidationEnum.empty;
    } else if (!contains('http')) {
      return UrlValidationEnum.http;
    } else {
      return RegexConstants.url.hasMatch(this)
          ? UrlValidationEnum.valid
          : UrlValidationEnum.invalid;
    }
  }
}
