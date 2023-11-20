import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

mixin Validators {
  FormFieldValidator<String> requiredFieldValidator(
      {required String errorMessage}) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: errorMessage),
    ]);
  }

  FormFieldValidator<String> lengthValidator(
      {required String errorMessage, required int length}) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.equalLength(length, errorText: errorMessage),
    ]);
  }
}
