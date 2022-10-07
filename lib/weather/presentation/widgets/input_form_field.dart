import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final TextEditingController controller;
  final String message;
  final String hint;
  final IconData icon;
  bool obscureText = true;
  IconData? suffixIcon;
  VoidCallback? suffixPressed;

  InputFormField(
      {Key? key,
      required this.obscureText,
      required this.controller,
      this.suffixPressed,
      this.suffixIcon,
      required this.message,
      required this.hint,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
      ),
      child: TextFormField(
        style: const TextStyle(
          fontFamily: 'PeugeotFont',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
        cursorColor: Colors.black26,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffixIcon,
              color: Colors.black,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black45,
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'PeugeotFont'),
        ),
      ),
    );
  }
}
