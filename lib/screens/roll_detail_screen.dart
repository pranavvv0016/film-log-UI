import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/sample_data.dart';
import '../models/film_roll.dart';
import '../widgets/sprocket_divider.dart';

class RollDetailScreen extends StatelessWidget {
  final FilmRoll roll;
  const RollDetailScreen({super.key, required this.roll});

  @override
  Widget build(BuildContext context) {
    final accent = Color(int.parse(roll.coverColor.substring(1), radix: 16) + 0xFF000000);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(title: const Text('Roll detail')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border(top: BorderSide(color: accent, width: 4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(roll.stock, style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 4),
                Text('${roll.format} · ${roll.camera}', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _stat(context, 'Frames', '${roll.shotFrames}/${roll.totalFrames}'),
                    _stat(context, 'Started', '${roll.startedOn.day}/${roll.startedOn.month}/${roll.startedOn.year}'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SprocketDivider(),
          const SizedBox(height: 16),
          Text('Frame log', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          ...sampleFrames.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 28,
                        child: Text('${f.number}', style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.note, style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 4),
                            Text(
                              '${f.aperture}  ${f.shutter}  ISO ${f.iso}  ·  ${f.location}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _stat(BuildContext context, String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 2),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
