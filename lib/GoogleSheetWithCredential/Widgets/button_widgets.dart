import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        maximumSize: const Size.fromHeight(50),
      ),
      onPressed: onClick,
      child: FittedBox(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
