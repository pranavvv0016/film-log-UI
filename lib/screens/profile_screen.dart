import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  final bool embedded;
  const ProfileScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      children: [
        Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(color: AppColors.safelight, shape: BoxShape.circle),
              child: const Center(child: Icon(Icons.person, color: AppColors.paper, size: 28)),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pranav', style: Theme.of(context).textTheme.headlineSmall),
                Text('4 cameras · 12 rolls logged', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        _section(context, 'Cameras', ['Pentax K1000', 'Canon AE-1', 'Olympus Trip 35', 'Yashica Mat-124G']),
        const SizedBox(height: 24),
        _section(context, 'Settings', ['Default film stock', 'Lab preferences', 'Export data', 'About Roll']),
      ],
    );

    if (embedded) return body;
    return Scaffold(backgroundColor: AppColors.bgDark, body: SafeArea(child: body));
  }

  Widget _section(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: List.generate(items.length, (i) {
              return Column(
                children: [
                  ListTile(
                    title: Text(items[i], style: Theme.of(context).textTheme.bodyLarge),
                    trailing: const Icon(Icons.chevron_right, color: AppColors.olive),
                  ),
                  if (i != items.length - 1) const Divider(height: 1, indent: 16, endIndent: 16),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
