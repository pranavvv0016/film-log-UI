import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/sample_data.dart';

class StatsScreen extends StatelessWidget {
  final bool embedded;
  const StatsScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final stockCounts = <String, int>{};
    for (final r in sampleRolls) {
      stockCounts[r.stock] = (stockCounts[r.stock] ?? 0) + 1;
    }
    final maxCount = stockCounts.values.fold(0, (a, b) => a > b ? a : b);
    final totalFrames = sampleRolls.fold<int>(0, (sum, r) => sum + r.shotFrames);

    final body = ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      children: [
        Text('Stats', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 4),
        Text('What you\u2019ve been shooting', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 24),
        Row(
          children: [
            _bigStat(context, '$totalFrames', 'frames shot'),
            _bigStat(context, '${sampleRolls.length}', 'rolls this year'),
          ],
        ),
        const SizedBox(height: 28),
        Text('By film stock', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        ...stockCounts.entries.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.key, style: Theme.of(context).textTheme.bodyLarge),
                      Text('${e.value}', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: e.value / maxCount,
                      minHeight: 8,
                      backgroundColor: AppColors.sprocket,
                      valueColor: const AlwaysStoppedAnimation(AppColors.safelightBright),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );

    if (embedded) return body;
    return Scaffold(backgroundColor: AppColors.bgDark, body: SafeArea(child: body));
  }

  Widget _bigStat(BuildContext context, String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
