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
        constraints: const BoxConstraints(
          maxWidth: 800,
        ), // Limita a largura do texto para melhor leitura
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Tamanho da fonte responsivo para o título da seção
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
              'Olá! Sou um desenvolvedor de software apaixonado por criar soluções inovadoras e eficientes. Com experiência em [linguagens/tecnologias], busco constantemente aprender e aplicar as melhores práticas do mercado. Meu foco é em [sua especialidade, ex: desenvolvimento web, mobile, backend, etc.], e adoro transformar ideias complexas em aplicações funcionais e intuitivas.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Ao longo da minha carreira, tive a oportunidade de trabalhar em projetos desafiadores que me permitiram aprimorar minhas habilidades em [mencione algumas habilidades, ex: arquitetura de software, otimização de performance, UI/UX]. Estou sempre aberto a novas oportunidades e colaborações.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
