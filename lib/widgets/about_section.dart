// lib/widgets/about_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landpageti/constants/app_colors.dart';
import 'package:landpageti/models/skill.dart'; // Importa o modelo de habilidade
import 'package:landpageti/widgets/skill_chip.dart'; // Importa o widget de chip de habilidade

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  final List<Skill> skills = const [
    Skill(name: 'Flutter', proficiency: 0.95),
    Skill(name: 'Dart', proficiency: 0.90),
    Skill(name: 'Python', proficiency: 0.85),
    Skill(name: 'JavaScript', proficiency: 0.80),
    Skill(name: 'Node.js', proficiency: 0.75),
    Skill(name: 'SQL', proficiency: 0.88),
    Skill(name: 'NoSQL (MongoDB)', proficiency: 0.70),
    Skill(name: 'AWS Cloud', proficiency: 0.65),
    Skill(name: 'Docker', proficiency: 0.60),
    Skill(name: 'Git/GitHub', proficiency: 0.92),
    Skill(name: 'UI/UX Design', proficiency: 0.78),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(40.0),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 900,
        ), // Aumenta um pouco a largura máxima
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sobre Mim',
              style: GoogleFonts.inter(
                fontSize: screenSize.width > 600 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Olá! Sou um desenvolvedor de software apaixonado por criar soluções inovadoras e eficientes. Com experiência em desenvolvimento web e mobile, busco constantemente aprender e aplicar as melhores práticas do mercado. Meu foco é em transformar ideias complexas em aplicações funcionais e intuitivas, com uma forte atenção à arquitetura limpa e à experiência do usuário.',
              style: GoogleFonts.inter(
                fontSize: 18,
                height: 1.5,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Ao longo da minha carreira, tive a oportunidade de trabalhar em projetos desafiadores que me permitiram aprimorar minhas habilidades em arquitetura de software, otimização de performance e design de interfaces. Estou sempre aberto a novas oportunidades e colaborações que me permitam crescer e contribuir com impacto.',
              style: GoogleFonts.inter(
                fontSize: 18,
                height: 1.5,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              'Minhas Habilidades',
              style: GoogleFonts.inter(
                fontSize: screenSize.width > 600 ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Layout responsivo para os chips de habilidades
            LayoutBuilder(
              builder: (context, constraints) {
                // Adapta o alinhamento e o espaçamento dos chips
                return Wrap(
                  spacing: 15.0, // Espaçamento horizontal entre os chips
                  runSpacing:
                      15.0, // Espaçamento vertical entre as linhas de chips
                  alignment: WrapAlignment.center, // Centraliza os chips
                  children: skills
                      .map(
                        (skill) => SkillChip(
                          skillName: skill.name,
                          proficiency: skill.proficiency,
                          iconPath: skill.iconPath,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
