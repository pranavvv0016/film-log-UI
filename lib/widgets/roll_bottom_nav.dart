import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RollBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const RollBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = const [
      (Icons.grid_view_rounded, 'Rolls'),
      (Icons.bar_chart_rounded, 'Stats'),
      (Icons.menu_book_rounded, 'Journal'),
      (Icons.person_outline_rounded, 'Profile'),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.sprocket, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(items.length, (i) {
            final selected = i == currentIndex;
            final color = selected ? AppColors.safelightBright : AppColors.olive;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(items[i].$1, color: color, size: 22),
                    const SizedBox(height: 4),
                    Text(items[i].$2, style: TextStyle(color: color, fontSize: 11, fontWeight: selected ? FontWeight.w600 : FontWeight.w400)),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
