import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {Widget? title,
      FormFieldSetter<bool>? onSaved,
      FormFieldValidator<bool>? validator,
      bool initialValue = false})
      : super(
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            builder: (field) => CheckboxListTile(
                  title: title,
                  value: field.value,
                  onChanged: field.didChange,
                  subtitle: field.hasError
                      ? Text(
                          field.errorText ?? '',
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ));
}
