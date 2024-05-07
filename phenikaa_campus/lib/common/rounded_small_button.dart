// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:phenikaa_campus/theme/theme.dart';

class RoundedSmallButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  const RoundedSmallButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor = Pallete.backgroundColor,
    this.textColor = Pallete.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
