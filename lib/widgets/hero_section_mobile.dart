// lib/widgets/hero_section_mobile.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landpageti/constants/app_colors.dart';

class HeroSectionMobile extends StatelessWidget {
  final VoidCallback scrollToProjects;

  const HeroSectionMobile({super.key, required this.scrollToProjects});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 100, // Raio ajustado para mobile
            backgroundImage: const AssetImage('assets/images/file.jpeg'),
            backgroundColor: AppColors.textLight.withOpacity(0.2),
          ),
          const SizedBox(height: 30),
          Text(
            'Olá, eu sou Moisés!',
            style: GoogleFonts.inter(
              fontSize: 40, // Fonte ajustada para mobile
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Engenheiro da Computação: Transformando Ideias Complexas em Soluções Digitais.',
            style: GoogleFonts.inter(
              fontSize: 20, // Fonte ajustada para mobile
              color: AppColors.textLight.withOpacity(0.8),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: scrollToProjects,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.textDark,
            ),
            child: const Text('Ver Meus Trabalhos'),
          ),
        ],
      ),
    );
  }
}
