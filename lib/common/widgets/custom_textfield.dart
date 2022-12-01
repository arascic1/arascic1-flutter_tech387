import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(95, 0, 0, 0)
          )
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(95, 0, 0, 0)
          )
        )
      ),
      
      validator: (val) {

      }
    );
  }
}