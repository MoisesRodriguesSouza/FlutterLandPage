// lib/widgets/testimonials_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landpageti/constants/app_colors.dart'; // Importa as cores

class Testimonial {
  final String quote;
  final String author;
  final String role;
  final String avatarUrl;

  const Testimonial({
    required this.quote,
    required this.author,
    required this.role,
    required this.avatarUrl,
  });
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  final List<Testimonial> testimonials = const [
    Testimonial(
      quote:
          'Moisés demonstrou uma capacidade excepcional em transformar ideias complexas em soluções práticas e eficientes. Sua dedicação e conhecimento técnico são admiráveis.',
      author: 'Ana Paula',
      role: 'Gerente de Projetos',
      avatarUrl:
          'https://placehold.co/80x80/E0E0E0/000000?text=AP', // Placeholder
    ),
    Testimonial(
      quote:
          'Trabalhar com Moisés foi uma experiência muito positiva. Ele é proativo, tem um olhar atento aos detalhes e entrega resultados de alta qualidade. Recomendo fortemente!',
      author: 'Carlos Eduardo',
      role: 'Desenvolvedor Sênior',
      avatarUrl:
          'https://placehold.co/80x80/E0E0E0/000000?text=CE', // Placeholder
    ),
    Testimonial(
      quote:
          'A expertise de Moisés em desenvolvimento de software foi crucial para o sucesso do nosso projeto. Ele é um profissional comprometido e com grande habilidade em resolver desafios.',
      author: 'Mariana Silva',
      role: 'CEO Startup Tech',
      avatarUrl:
          'https://placehold.co/80x80/E0E0E0/000000?text=MS', // Placeholder
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundLight, // Usando a cor de fundo clara
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Opiniões que Nos Inspiram',
            style: GoogleFonts.inter(
              fontSize: screenSize.width > 600 ? 38 : 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              double childAspectRatio = 1.0; // Padrão para mobile
              if (constraints.maxWidth > 900) {
                crossAxisCount = 3;
                childAspectRatio = 1.2; // Mais largo para desktop
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 2;
                childAspectRatio = 1.1; // Mais largo para tablet
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: testimonials.length,
                itemBuilder: (context, index) {
                  final testimonial = testimonials[index];
                  return TestimonialCard(testimonial: testimonial);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, // Sombra mais proeminente
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), // Cantos mais arredondados
      color: AppColors.cardBackground, // Fundo do card
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(testimonial.avatarUrl),
              backgroundColor: AppColors.primary.withOpacity(0.2),
            ),
            const SizedBox(height: 20),
            Text(
              '“${testimonial.quote}”',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Text(
              testimonial.author,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              testimonial.role,
              style: GoogleFonts.inter(fontSize: 14, color: AppColors.greyText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
