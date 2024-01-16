import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;

  const CustomButton({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(32),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black54),
      ),
      onPressed: () {},
      child: Text(
        name,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
