import 'package:flutter/material.dart';

class NavigateUserWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPrevious, onNext;
  const NavigateUserWidget({
    super.key,
    required this.text,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 45,
            onPressed: onPrevious,
            icon: const Icon(Icons.navigate_before),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            iconSize: 45,
            onPressed: onNext,
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      );
}
