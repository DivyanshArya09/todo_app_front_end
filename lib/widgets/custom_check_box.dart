import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final Function(bool?)? onChanged;
  const CustomCheckBox({super.key, required this.onChanged});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
          widget.onChanged!(value);
        });
      },
    );
  }
}
