// Created by Adipt on 17/01/2022

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final bool? isPasswordVisible;
  final Function()? onVisibilityChanged;
  final TextInputType? keyBoardType;

  const QTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.isPasswordVisible,
    this.onVisibilityChanged,
    this.keyBoardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextField(
        keyboardType: keyBoardType,
        onChanged: onChanged,
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        obscureText: (isPasswordVisible != null)? isPasswordVisible!:false,
        decoration: InputDecoration(
          suffixIcon: isPasswordVisible != null
              ? GestureDetector(
                  onTap: onVisibilityChanged,
                  child: Icon(
                    (isPasswordVisible!)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: Colors.grey,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
