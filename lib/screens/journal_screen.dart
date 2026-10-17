import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/sample_data.dart';
import '../widgets/sprocket_divider.dart';

class JournalScreen extends StatelessWidget {
  final bool embedded;
  const JournalScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      children: [
        Text('Journal', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 4),
        Text('Notes from behind the camera', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 24),
        ...sampleJournal.map((j) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${j.date.day}/${j.date.month}/${j.date.year}', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(j.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(j.body, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  const SprocketDivider(height: 14),
                ],
              ),
            )),
      ],
    );

    if (embedded) return body;
    return Scaffold(backgroundColor: AppColors.bgDark, body: SafeArea(child: body));
  }
}
