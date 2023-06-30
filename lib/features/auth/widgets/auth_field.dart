import 'package:flutter/material.dart';
import 'package:laundry/theme/pallete.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AuthField({
    
    super.key, 
    required this.controller,
    required this.hintText,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Pallete.greyColor,
            width: 3,
          ),

        ),


         enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 242, 232, 255),
            width: 3,
          ),

        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        )
      ),
    );
  }}