// ignore_for_file: avoid_positional_boolean_parameters

import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([
    this.isOptional = false,
  ]) : super.pure('');
  const Email.dirty({
    String value = '',
    this.isOptional = false,
  }) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  final bool isOptional;

  @override
  EmailValidationError? validator(String? value) {
    final validate =
        emailRegExp.hasMatch(value ?? '') ? null : EmailValidationError.invalid;

    if (isOptional) {
      if (value?.isEmpty ?? true) {
        return null;
      } else {
        return validate;
      }
    }
    return validate;
  }
}
