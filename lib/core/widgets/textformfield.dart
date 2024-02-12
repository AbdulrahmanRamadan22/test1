import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.prefixIcon,
      this.color,
      this.bordercolor,
      this.backgroundcolor,
      this.obscureText = false,
      this.onChanged,
      this.hintText});
  Function(String)? onChanged;
  String? hintText;
  Widget? prefixIcon;
  bool? obscureText;
  Color? color;
  Color? bordercolor;
  Color? backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 368,
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'value is wrong';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: kPrimaryColor,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 10, color: color),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
        ),
      ),
    );
  }
}
