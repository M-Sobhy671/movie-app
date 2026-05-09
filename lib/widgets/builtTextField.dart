import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';

Widget buildTextField(
    String hint,
    String icon,
    TextEditingController controller,
    String valText,
    // دا التعديل
    bool isEmail,
    bool isPass ,
    VoidCallback? onSuffixTap,
    ) {
  return TextFormField(
    controller: controller,
    obscureText: isPass,
    style: const TextStyle(color: Colors.white, fontSize: 16),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white),
      prefixIcon: Image.asset(icon),
      suffixIcon: onSuffixTap !=null ?
      IconButton(onPressed: onSuffixTap, icon: Image.asset(
          isPass ? Appassets.pass_eye : Appassets.pass_eye),):null,
      filled: true,
      fillColor: const Color(0xFF1C1C1E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return valText;
      }
      if (isEmail &&!value.contains("@")) {
        return "Invalid Email";
      }
      return null;
    },
  );
}