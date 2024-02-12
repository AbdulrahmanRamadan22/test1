// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldon extends StatelessWidget {
  final bool first;
  final bool last;
  final TextEditingController controller;

  const CustomTextFieldon({
    required this.controller,
    required this.first,
    required this.last,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: const Color(0xff043E4B),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.width / 6,
            maxWidth: MediaQuery.of(context).size.width / 7,
          ),
        ),
      ),
    );
  }
}
