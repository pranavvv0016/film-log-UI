import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // A simple aperture mark — the one bold visual gesture on this screen.
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.safelightBright, width: 2),
              ),
              child: Center(
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(color: AppColors.safelightBright, shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Roll', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 6),
            Text('one frame at a time', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
