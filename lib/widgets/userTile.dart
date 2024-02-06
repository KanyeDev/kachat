import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(height: 65,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [ CircleAvatar(radius: 17,backgroundColor: Theme.of(context).colorScheme.inversePrimary, child: const Icon(Icons.person),), const Gap(20), Text(text)],
        ),
      ),
    );
  }
}
