// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importe o Google Fonts
import 'package:landpageti/constants/app_colors.dart'; // Importa as cores
import 'package:landpageti/screens/portfolio_home_page.dart'; // Importa a página principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Portfólio de TI',
      theme: ThemeData(
        // Usando as cores primárias do AppColors
        primarySwatch:
            MaterialColor(AppColors.primary.value, const <int, Color>{
              50: AppColors.primary,
              100: AppColors.primary,
              200: AppColors.primary,
              300: AppColors.primary,
              400: AppColors.primary,
              500: AppColors.primary,
              600: AppColors.primary,
              700: AppColors.primary,
              800: AppColors.primary,
              900: AppColors.primary,
            }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Aplica a fonte Inter do Google Fonts para todo o tema de texto
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary, // Cor do AppBar
          foregroundColor: AppColors.textLight, // Cor do texto do AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, // Cor do botão elevado
            foregroundColor:
                AppColors.textLight, // Cor do texto do botão elevado
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor:
                AppColors.primary, // Cor do texto dos botões de texto
          ),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}
