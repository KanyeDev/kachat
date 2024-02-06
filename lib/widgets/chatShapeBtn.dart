import 'package:flutter/material.dart';

class MyChatShapeBtn extends StatelessWidget {
  const MyChatShapeBtn({
    super.key,
    required this.onTap, required this.text, required this.isLoading,
  });

  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 200,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0.8, 2), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(5),
            ),
            color: Theme.of(context).colorScheme.inversePrimary),
        child: isLoading?  Center(child: CircularProgressIndicator(strokeWidth: 4,color: Theme.of(context).colorScheme.background,)) : Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}