import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';

class RadiusText extends StatelessWidget {
  final String text;
  const RadiusText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(
          text: text,
          style: const TextStyle(
            color: ConsColors.blue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final hasTwoLines = textPainter.didExceedMaxLines;

        return Container(
          height: hasTwoLines ? 70 : 60,
          decoration: BoxDecoration(
            color: ConsColors.blueWhite,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: ConsColors.yellow),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ConsColors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
