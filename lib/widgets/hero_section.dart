// lib/widgets/hero_section.dart
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback scrollToProjects;

  // Construtor agora espera scrollToProjects
  const HeroSection({super.key, required this.scrollToProjects});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40.0),
      color: Colors.blueGrey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/file.jpeg'), // Usando a imagem local
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 20),
          Text(
            'Olá, eu sou Moisés!', // Nome atualizado
            style: TextStyle(
              fontSize: screenSize.width > 600 ? 48 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Engenheiro da Computação | Especialista em Desenvolvedor de Software', // Título atualizado
            style: TextStyle(
              fontSize: screenSize.width > 600 ? 24 : 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: scrollToProjects, // Usa a callback para rolagem suave
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Ver Meus Trabalhos'),
          ),
        ],
      ),
    );
  }
}