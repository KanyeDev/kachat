import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool isObscured;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTextField({
    super.key,
    required this.hintText, required this.isObscured, required this.controller,
    this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(

        validator: (value){
          if(value!.isEmpty){
            return hintText;
          }
          return null;
        },
        controller: controller,
        obscureText: isObscured,
        focusNode: focusNode,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText, hintStyle:TextStyle(color:  Theme.of(context).colorScheme.tertiary)),

      ),
    );
  }
}
