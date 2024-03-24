import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String heading;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final bool validate;
  final bool readOnly;
  final VoidCallback? ontap;
  final ValueChanged? onChanged;
  final int maxLines;
  final int? maxLength;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.heading,
    required this.hintText,
    this.isObscure = false,
    required this.keyboardType,
    this.validate = true,
    this.readOnly = false,
    this.ontap,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          minLines: 1,
          maxLength: maxLength,
          maxLines: maxLines,
          readOnly: readOnly,
          controller: controller,
          validator: validate
              ? (value) {
                  if (value!.isEmpty) {
                    return "$heading cannot be empty";
                  } else {
                    return null;
                  }
                }
              : (value) {
                  return null;
                },
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
          onTap: ontap,
          obscureText: isObscure,
          obscuringCharacter: "*",
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                letterSpacing: 1,
              ),
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              )),
        ),
      ],
    );
  }
}
