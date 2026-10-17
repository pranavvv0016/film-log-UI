import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens for Roll — a darkroom-inspired visual language.
/// Palette is drawn from analog photography: safelight red, spent
/// film canisters, darkroom brown-black, and paper contact sheets.
class AppColors {
  static const bgDark = Color(0xFF1A1512); // darkroom near-black
  static const surface = Color(0xFF241E1A); // canister brown, elevated surface on dark
  static const paper = Color(0xFFF2EBE1); // contact-sheet paper
  static const paperDim = Color(0xFFE7DDCC);
  static const safelight = Color(0xFFA63D2F); // darkroom safelight accent
  static const safelightBright = Color(0xFFC24B3A);
  static const olive = Color(0xFF8A8270); // muted text, film-grey
  static const sprocket = Color(0xFF3A322C); // sprocket-hole divider tone
  static const developed = Color(0xFF6E8368); // "developed" status green, muted
  static const waiting = Color(0xFFBB8C3F); // "in lab" status amber
}

class AppText {
  static TextTheme textTheme(Brightness brightness) {
    final base = brightness == Brightness.dark
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;
    final onSurface = brightness == Brightness.dark ? AppColors.paper : AppColors.bgDark;

    return base.copyWith(
      displayLarge: GoogleFonts.fraunces(
        fontSize: 34, fontWeight: FontWeight.w600, color: onSurface, height: 1.1, letterSpacing: -0.3,
      ),
      displayMedium: GoogleFonts.fraunces(
        fontSize: 26, fontWeight: FontWeight.w600, color: onSurface, height: 1.15,
      ),
      headlineSmall: GoogleFonts.fraunces(
        fontSize: 20, fontWeight: FontWeight.w600, color: onSurface,
      ),
      bodyLarge: GoogleFonts.inter(fontSize: 16, color: onSurface, height: 1.4),
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: onSurface.withValues(alpha: 0.75), height: 1.4),
      bodySmall: GoogleFonts.inter(fontSize: 12, color: onSurface.withValues(alpha: 0.6)),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: onSurface),
      titleMedium: GoogleFonts.jetBrainsMono(fontSize: 14, color: onSurface, letterSpacing: 0.2),
      titleSmall: GoogleFonts.jetBrainsMono(fontSize: 12, color: onSurface.withValues(alpha: 0.7)),
    );
  }
}

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      primaryColor: AppColors.safelight,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.safelight,
        secondary: AppColors.waiting,
        surface: AppColors.surface,
        onSurface: AppColors.paper,
      ),
      textTheme: AppText.textTheme(Brightness.dark),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgDark,
        elevation: 0,
        titleTextStyle: GoogleFonts.fraunces(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.paper),
        iconTheme: const IconThemeData(color: AppColors.paper),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.safelight,
          foregroundColor: AppColors.paper,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15),
          elevation: 0,
        ),
      ),
      dividerColor: AppColors.sprocket,
      useMaterial3: true,
    );
  }
}
