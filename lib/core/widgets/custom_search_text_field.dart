import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixOnPressed,
    this.suffixOnPressed,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? prefixOnPressed;
  final void Function()? suffixOnPressed;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onChanged,
      focusNode: focusNode,
      readOnly: readOnly,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: buildOutlinInputBorder(),
          focusedBorder: buildOutlinInputBorder(),
          hintText: 'Search',
          prefixIcon: prefixIcon != null
              ? IconButton(
                  onPressed: prefixOnPressed,
                  icon: Icon(
                    prefixIcon,
                    size: 32,
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixOnPressed,
                  icon: Icon(
                    suffixIcon,
                    size: 32,
                  ),
                )
              : null),
    );
  }

  OutlineInputBorder buildOutlinInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
