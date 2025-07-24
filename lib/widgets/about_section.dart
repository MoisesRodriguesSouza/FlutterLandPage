// lib/widgets/about_section.dart
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(40.0),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800), // Limita a largura do texto
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sobre Mim',
              style: TextStyle(
                fontSize: screenSize.width > 600 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Olá! Sou um desenvolvedor de software apaixonado por transformar ideias em soluções digitais inovadoras, escaláveis e eficientes. Com sólida experiência em tecnologias como Flutter, desenvolvimento de APIs RESTful, arquitetura baseada em microsserviços, e integração com bancos de dados relacionais e não-relacionais, busco constantemente evoluir tecnicamente e aplicar as melhores práticas do mercado.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Tenho atuado principalmente nas áreas de desenvolvimento mobile e backend, criando aplicações modernas, performáticas e com foco em uma excelente experiência do usuário. Ao longo da minha carreira, participei de projetos desafiadores que me permitiram aprofundar conhecimentos em arquitetura de software, otimização de performance, design de APIs, e boas práticas de UI/UX. Sou movido por aprendizado contínuo, colaboração e a oportunidade de impactar positivamente a vida das pessoas por meio da tecnologia. Estou sempre aberto a novos desafios, trocas de conhecimento e parcerias que impulsionem a inovação.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}