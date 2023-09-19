import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  final bool disabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size4),
          color: disabled
              ? isDarkMode(context)
                  ? Colors.grey.shade800
                  : Colors.grey.shade300
              : Colors.blue.shade700,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
              color: disabled ? Colors.grey.shade500 : Colors.white,
              fontWeight: FontWeight.w600),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: Sizes.size16),
          ),
        ),
      ),
    );
  }
}
