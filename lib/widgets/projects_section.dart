// lib/widgets/projects_section.dart
import 'package:flutter/material.dart';
import 'package:landpageti/models/project.dart'; // Importa o modelo de Project
import 'package:landpageti/widgets/project_card.dart'; // Importa o ProjectCard

class ProjectsSection extends StatelessWidget {
  // Removido o 'const' da declaração da lista de projetos
  final List<Project> projects = [ // A lista agora é apenas 'final', não 'const'
     Project( // Os elementos da lista podem ser 'const' se seus construtores forem
      name: 'E-commerce App',
      description: 'Aplicativo de e-commerce completo com carrinho de compras, pagamentos e gerenciamento de produtos.',
      imageUrl: 'assets/images/projeto1.jpg',
      projectUrl: 'https://github.com/seugithub/ecommerce-app', // Exemplo de URL
    ),
     Project(
      name: 'Sistema de Gerenciamento',
      description: 'Sistema web para gerenciamento de tarefas e equipes, com dashboard interativo.',
      imageUrl: 'assets/images/projeto2.jpg',
      projectUrl: 'https://github.com/seugithub/task-manager',
    ),
     Project(
      name: 'Blog Pessoal',
      description: 'Plataforma de blog responsiva com sistema de autenticação e editor de posts.',
      imageUrl: 'assets/images/projeto3.jpg',
      projectUrl: 'https://github.com/seugithub/personal-blog',
    ),
     Project(
      name: 'API RESTful',
      description: 'Desenvolvimento de uma API robusta para serviço de backend, utilizando Node.js e MongoDB.',
      imageUrl: 'assets/images/projeto4.jpg',
      projectUrl: 'https://github.com/seugithub/rest-api-example',
    ),
     Project(
      name: 'Game Casual Mobile',
      description: 'Um jogo simples e divertido para dispositivos móveis, desenvolvido com Flutter e Flame.',
      imageUrl: 'assets/images/projeto5.jpg',
      projectUrl: 'https://github.com/seugithub/mobile-game',
    ),
     Project(
      name: 'Análise de Dados Interativa',
      description: 'Dashboard interativo para visualização e análise de dados de vendas, usando Python e Dash.',
      imageUrl: 'assets/images/projeto6.jpg',
      projectUrl: 'https://github.com/seugithub/data-dashboard',
    ),
  ];

   ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Text(
            'Meus Trabalhos',
            style: TextStyle(
              fontSize: screenSize.width > 600 ? 36 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
            ),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 900) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 2;
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Desabilita a rolagem interna do GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.2, // Ajusta a proporção dos itens
                ),
                itemCount: projects.length, // Usa o tamanho da lista de projetos
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCard(
                    projectName: project.name,
                    description: project.description,
                    imageUrl: project.imageUrl,
                    projectUrl: project.projectUrl, // Passa a URL do projeto
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}