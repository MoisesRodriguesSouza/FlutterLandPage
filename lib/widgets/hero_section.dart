// lib/widgets/hero_section.dart
import 'package:flutter/material.dart';
import 'package:landpageti/widgets/hero_section_desktop.dart'; // Importa a versão desktop
import 'package:landpageti/widgets/hero_section_mobile.dart'; // Importa a versão mobile

class HeroSection extends StatelessWidget {
  final VoidCallback scrollToProjects;

  const HeroSection({super.key, required this.scrollToProjects});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Usa LayoutBuilder para renderizar a versão desktop ou mobile
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // breakpoint para desktop
          return HeroSectionDesktop(scrollToProjects: scrollToProjects);
        } else {
          return HeroSectionMobile(scrollToProjects: scrollToProjects);
        }
      },
    );
  }
}
