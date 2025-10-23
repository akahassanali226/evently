// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  bool isPassword;
  TextInputAction textInputAction;
  TextInputType textInputType;
  String? Function(String?) validator;
  String hintText;
  TextEditingController controller;
  Widget icon;

  CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.textInputAction,
    required this.textInputType,
    required this.validator,
    required this.hintText,
    required this.controller,
    required this.icon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecurity = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecurity,
      controller: widget.controller,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: Theme.of(context).textTheme.bodyMedium,
      autocorrect: true,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        prefixIcon: widget.icon,
        prefixIconColor: Theme.of(context).colorScheme.tertiary,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecurity = !obsecurity;
                  });
                },
                icon: Icon(
                  obsecurity ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        suffixIconColor: Theme.of(context).colorScheme.tertiary,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
