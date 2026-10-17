import 'package:flutter/material.dart';
import '../models/film_roll.dart';
import '../theme/app_theme.dart';

String _statusLabel(RollStatus s) {
  switch (s) {
    case RollStatus.shooting:
      return 'Shooting';
    case RollStatus.atLab:
      return 'At the lab';
    case RollStatus.developed:
      return 'Developed';
  }
}

Color _statusColor(RollStatus s) {
  switch (s) {
    case RollStatus.shooting:
      return AppColors.safelightBright;
    case RollStatus.atLab:
      return AppColors.waiting;
    case RollStatus.developed:
      return AppColors.developed;
  }
}

/// A roll rendered like a canister label: stock name set large,
/// frame progress as a literal filled bar (the way a film-back
/// window shows how far along the roll is), status as a colored tag.
class RollCard extends StatelessWidget {
  final FilmRoll roll;
  final VoidCallback? onTap;
  const RollCard({super.key, required this.roll, this.onTap});

  @override
  Widget build(BuildContext context) {
    final progress = roll.shotFrames / roll.totalFrames;
    final accent = Color(int.parse(roll.coverColor.substring(1), radix: 16) + 0xFF000000);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border(left: BorderSide(color: accent, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(roll.stock, style: Theme.of(context).textTheme.headlineSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _statusColor(roll.status).withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _statusLabel(roll.status),
                    style: TextStyle(color: _statusColor(roll.status), fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text('${roll.format} · ${roll.camera}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.sprocket,
                valueColor: AlwaysStoppedAnimation(accent),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${roll.shotFrames} / ${roll.totalFrames} frames',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
