import 'package:flutter/material.dart';

final class CardWidget extends StatelessWidget {
  final String? headline;
  final String? subhead;
  final String? supportingText;
  final Image? supportingImage;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final bool headlineBolded;

  const CardWidget.outlined({
    super.key,
    this.headline,
    this.subhead,
    this.supportingText,
    this.buttonText,
    this.onButtonPressed,
    this.supportingImage,
    this.headlineBolded = false,
  });

  bool get _hasButton => buttonText != null && onButtonPressed != null;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card.outlined(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (headline != null)
              Text(
                headline!,
                style: headlineBolded
                    ? textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: .25,
                      )
                    : textTheme.titleLarge,
              ),
            if (subhead != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subhead!,
                  style: textTheme.titleMedium,
                ),
              ),
            if (supportingText != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  supportingText!,
                  style: textTheme.bodySmall,
                ),
              ),
            if (supportingImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: supportingImage!,
              ),
            if (_hasButton)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: FilledButton.tonal(
                  onPressed: onButtonPressed!,
                  child: Text(buttonText!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
