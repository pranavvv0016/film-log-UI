import '../data/film_api_service.dart';
import '../models/film_roll.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/sample_data.dart';
import '../widgets/roll_card.dart';
import '../widgets/roll_bottom_nav.dart';
import '../widgets/sprocket_divider.dart';
import 'roll_detail_screen.dart';
import 'add_frame_screen.dart';
import 'stats_screen.dart';
import 'journal_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _RollsTab(),
      const StatsScreen(embedded: true),
      const JournalScreen(embedded: true),
      const ProfileScreen(embedded: true),
    ];

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(child: pages[_tab]),
      bottomNavigationBar: RollBottomNav(currentIndex: _tab, onTap: (i) => setState(() => _tab = i)),
      floatingActionButton: _tab == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.safelightBright,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddFrameScreen())),
              child: const Icon(Icons.add_a_photo_outlined, color: AppColors.paper),
            )
          : null,
    );
  }
}

class _RollsTab extends StatelessWidget {
  const _RollsTab();

  @override
  Widget build(BuildContext context) {
    final active = sampleRolls.where((r) => r.status != RollStatus.developed).toList();
    final done = sampleRolls.where((r) => r.status == RollStatus.developed).toList();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your rolls', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 4),
                Text('${active.length} in progress · ${done.length} developed', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
            itemCount: active.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => RollCard(
              roll: active[i],
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RollDetailScreen(roll: active[i]))),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SprocketDivider(),
                const SizedBox(height: 12),
                Text('Developed', style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
          sliver: SliverList.separated(
            itemCount: done.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => RollCard(
              roll: done[i],
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RollDetailScreen(roll: done[i]))),
            ),
          ),
        ),
        SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
    child: const _ApiDemoSection(),
  ),
),
      ],
    );
  }
}

class _ApiDemoSection extends StatefulWidget {
  const _ApiDemoSection();

  @override
  State<_ApiDemoSection> createState() => _ApiDemoSectionState();
}

class _ApiDemoSectionState extends State<_ApiDemoSection> {
  late Future<List<String>> _data;

  @override
  void initState() {
    super.initState();
    _data = FilmApiService.fetchFilmStocks();
  }

  void _retry() {
    setState(() {
      _data = FilmApiService.fetchFilmStocks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        border: Border.all(color: AppColors.sprocket),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live API Demo',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          const Text(
            'Sample product data from a public API, '
            'used to demonstrate HTTP requests.',
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<String>>(
            future: _data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Could not load data.'),
                    TextButton(
                      onPressed: _retry,
                      child: const Text('Try again'),
                    ),
                  ],
                );
              }

              final items = snapshot.data ?? [];

              if (items.isEmpty) {
                return const Text('No data available.');
              }

              return Column(
                children: items
                    .map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.cloud_done_outlined),
                        title: Text(item),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

