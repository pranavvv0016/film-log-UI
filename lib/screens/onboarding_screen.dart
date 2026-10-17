import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class _Page {
  final String title;
  final String body;
  final IconData icon;
  const _Page(this.title, this.body, this.icon);
}

const _pages = [
  _Page('Log every roll', 'Track stock, format, and camera for each roll from first frame to last.', Icons.camera_roll_outlined),
  _Page('Note the shot', 'Aperture, shutter, ISO, and a line about the light — before you forget it.', Icons.tune_rounded),
  _Page('Follow it to the lab', 'Know what\u2019s still shooting, what\u2019s developing, and what came back.', Icons.local_shipping_outlined),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  void _next() {
    if (_index < _pages.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: Text('Skip', style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final p = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(p.icon, size: 56, color: AppColors.safelightBright),
                        const SizedBox(height: 28),
                        Text(p.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 12),
                        Text(p.body, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: active ? AppColors.safelightBright : AppColors.sprocket,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Text(_index == _pages.length - 1 ? 'Get started' : 'Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
