import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.letterSpacing,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    this.fontSize,
  }) : super(key: key);
  final String label;
  final void Function() onPressed;
  final bool isLoading;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsets padding;
  final double? fontSize;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enabled ? onPressed : null,
      color: backgroundColor ?? context.colors.tintGreen2,
      elevation: 0,
      disabledColor: context.colors.white10.withOpacity(0.1),
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      splashColor: context.colors.tintBlack.withOpacity(0.1),
      padding: padding,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? context.colors.tintBlack),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Stack is needed to prevent the content from changing the button size
          // when changing from the text state to the loader state.
          SizedBox(
            height: 20,
            child: Visibility(
                visible: isLoading, child: const CircularProgressIndicator()),
          ),
          Opacity(
            opacity: isLoading ? .0 : 1.0,
            child: AutoSizeText(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTextStyles.primaryButton.copyWith(
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                color: enabled
                    ? textColor ?? context.colors.tintBlack
                    : context.colors.white10.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
