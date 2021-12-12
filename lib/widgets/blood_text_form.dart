import 'package:blood/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class BloodTextForm extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;

  const BloodTextForm({
    Key? key,
    this.onChanged,
    this.validator,
    required this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 0, right: 16, left: 16),
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: secondaryTextLight,
                ),
          ),
        ),
      ),
    );
  }
}
