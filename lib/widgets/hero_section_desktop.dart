// lib/widgets/hero_section_desktop.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landpageti/constants/app_colors.dart';

class HeroSectionDesktop extends StatelessWidget {
  final VoidCallback scrollToProjects;

  const HeroSectionDesktop({super.key, required this.scrollToProjects});

  @override
  Widget build(BuildContext context) {
    // Usando um Gradient para o fundo
    return Container(
      width: double.infinity,
      height: 600, // Altura fixa para desktop
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ), // Limita a largura do conteúdo
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Coluna de texto
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Olá, eu sou Moisés!',
                        style: GoogleFonts.inter(
                          fontSize: 64, // Fonte maior para desktop
                          fontWeight: FontWeight.bold,
                          color: AppColors.textLight,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Engenheiro da Computação: Transformando Ideias Complexas em Soluções Digitais Escaláveis e Intuitivas.',
                        style: GoogleFonts.inter(
                          fontSize: 28, // Fonte maior para desktop
                          color: AppColors.textLight.withOpacity(0.8),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: scrollToProjects,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor:
                              AppColors.accent, // Botão de destaque
                          foregroundColor: AppColors.textDark,
                        ),
                        child: const Text('Ver Meus Trabalhos'),
                      ),
                    ],
                  ),
                ),
              ),
              // Imagem de perfil
              Expanded(
                flex: 2,
                child: Center(
                  child: CircleAvatar(
                    radius: 180, // Raio maior para desktop
                    backgroundImage: const AssetImage(
                      'assets/images/file.jpeg',
                    ),
                    backgroundColor: AppColors.textLight.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
