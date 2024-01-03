import 'package:flutter/material.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      minLines: 6,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        hintText: "Content",
        border: InputBorder.none,
      ),
    );
  }
}
