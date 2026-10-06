import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the Flutter mobile application configured with a dark aesthetic.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Design tokens from specifications:
    // Background:     #0F0F12
    // Card/Surface:   #18181C
    // Text:           #F5F5F5
    // Secondary text: #A0A0A8
    // Accent:         Violet/Blue (#6366F1)
    const backgroundColor = Color(0xFF0F0F12);
    const surfaceColor = Color(0xFF18181C);
    const textColor = Color(0xFFF5F5F5);
    const secondaryTextColor = Color(0xFFA0A0A8);
    const accentColor = Color(0xFF6366F1); // Modern violet/blue accent
    const errorColor = Color(0xFFEF4444); // High-contrast error color

    final colorScheme = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: accentColor,
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFF26253B), // Subtle container for icons
      onPrimaryContainer: const Color(0xFFA5B4FC),
      surface: surfaceColor,
      onSurface: textColor,
      onSurfaceVariant: secondaryTextColor,
      outline: const Color(0xFF2B2B33),
      error: errorColor,
      onError: Colors.white,
    );

    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: colorScheme,
        // Typography matching dark palette
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: secondaryTextColor,
          ),
          bodyLarge: TextStyle(
            color: textColor,
          ),
        ),
        // Styled rounded inputs with dark charcoal surfaces and subtle borders
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceColor,
          hintStyle: const TextStyle(color: Color(0xFF6B6B76)),
          labelStyle: const TextStyle(color: secondaryTextColor),
          prefixIconColor: secondaryTextColor,
          suffixIconColor: secondaryTextColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2B2B33)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2B2B33)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: accentColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: errorColor,
              width: 1.5,
            ),
          ),
          errorStyle: const TextStyle(
            color: Color(0xFFF87171),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Styled rounded buttons with accent color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 0,
          ),
        ),
        // Text button styling with light violet for high contrast
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF818CF8),
          ),
        ),
        // Checkbox styling matching dark aesthetic
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return accentColor;
            }
            return surfaceColor;
          }),
          checkColor: WidgetStateProperty.all(Colors.white),
          side: const BorderSide(color: Color(0xFF3B3B44), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // AppBar for back button navigation
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: textColor,
          iconTheme: IconThemeData(color: textColor),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
