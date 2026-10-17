import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A row of small perforations, like the sprocket holes running along
/// the edge of a film strip. Used as a section divider — this is a
/// literal detail from the subject matter, not decoration for its own sake.
class SprocketDivider extends StatelessWidget {
  final double height;
  const SprocketDivider({super.key, this.height = 18});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final count = (constraints.maxWidth / 22).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              count,
              (i) => Container(
                width: 6,
                height: 9,
                decoration: BoxDecoration(
                  color: AppColors.sprocket,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
