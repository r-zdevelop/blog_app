import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  const AuthField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText cannot be empty";
        }
        return null;
      },
    );
  }
}
