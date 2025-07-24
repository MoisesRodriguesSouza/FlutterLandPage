// lib/widgets/projects_section.dart
import 'package:flutter/material.dart';
import 'package:landpageti/models/project.dart'; // Importa o modelo de Project
import 'package:landpageti/widgets/project_card.dart'; // Importa o ProjectCard

class ProjectsSection extends StatelessWidget {
  // Removido o 'const' da declaração da lista de projetos.
  // A lista agora é apenas 'final', não 'const', pois contém elementos que podem não ser constantes em tempo de compilação.
  // No entanto, cada Project individualmente PODE ser 'const' se todas as suas propriedades forem constantes.
  final List<Project> projects = const [
    Project(
      name: 'E-commerce App',
      description: 'Aplicativo de e-commerce completo com carrinho de compras, pagamentos e gerenciamento de produtos.',
      longDescription: 'Este é um aplicativo de e-commerce robusto e escalável, desenvolvido com Flutter para o frontend e um backend RESTful. Ele oferece funcionalidades completas como catálogo de produtos, carrinho de compras intuitivo, processo de checkout seguro com integração de pagamentos, gerenciamento de pedidos e perfis de usuário. O design responsivo garante uma experiência de usuário impecável em dispositivos móveis e web.', // Descrição longa
      imageUrl: 'assets/images/projeto1.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage', // Exemplo de URL
    ),
    Project(
      name: 'Sistema de Gerenciamento',
      description: 'Sistema web para gerenciamento de tarefas e equipes, com dashboard interativo.',
      longDescription: 'Um sistema de gerenciamento web completo, projetado para otimizar a organização de tarefas e a colaboração em equipe. Inclui um dashboard interativo com gráficos de progresso, atribuição de tarefas, prazos, e funcionalidades de comunicação interna. Desenvolvido com [mencione tecnologias, ex: Flutter Web, Node.js, PostgreSQL], focado em usabilidade e eficiência para ambientes corporativos.',
      imageUrl: 'assets/images/projeto2.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage',
    ),
    Project(
      name: 'Blog Pessoal',
      description: 'Plataforma de blog responsiva com sistema de autenticação e editor de posts.',
      longDescription: 'Uma plataforma de blog pessoal moderna e responsiva, onde você pode compartilhar seus conhecimentos e experiências. Possui um sistema de autenticação de usuários, um editor de texto rico para criação de posts, categorias, tags e funcionalidades de busca. O design é otimizado para leitura em qualquer dispositivo, proporcionando uma experiência agradável aos visitantes.',
      imageUrl: 'assets/images/projeto3.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage',
    ),
    Project(
      name: 'API RESTful',
      description: 'Desenvolvimento de uma API robusta para serviço de backend, utilizando Node.js e MongoDB.',
      longDescription: 'Desenvolvimento de uma API RESTful de alta performance, projetada para servir como backend para aplicações web e móveis. Implementada com Node.js, Express e MongoDB, a API oferece endpoints seguros para [mencione funcionalidades, ex: autenticação de usuários, CRUD de dados, upload de arquivos]. Inclui documentação Swagger para fácil integração e testes.',
      imageUrl: 'assets/images/projeto4.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage',
    ),
    Project(
      name: 'Game Casual Mobile',
      description: 'Um jogo simples e divertido para dispositivos móveis, desenvolvido com Flutter e Flame.',
      longDescription: 'Um jogo casual divertido e viciante, desenvolvido para plataformas móveis (Android e iOS) utilizando Flutter e o framework Flame para jogos. O jogo apresenta [descreva a jogabilidade, ex: controles intuitivos, gráficos colorful, sistema de pontuação]. Ideal para momentos de lazer e para demonstrar as capacidades do Flutter em desenvolvimento de jogos.',
      imageUrl: 'assets/images/projeto5.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage',
    ),
    Project(
      name: 'Análise de Dados Interativa',
      description: 'Dashboard interativo para visualização e análise de dados de vendas, usando Python e Dash.',
      longDescription: 'Um dashboard interativo para análise de dados de vendas, construído com Python e a biblioteca Dash. Permite aos usuários explorar tendências de vendas, desempenho de produtos e segmentação de clientes através de gráficos dinâmicos e filtros. Uma ferramenta poderosa para insights de negócios e tomada de decisões baseada em dados.',
      imageUrl: 'assets/images/projeto6.png', // Corrigido para .png
      projectUrl: 'https://github.com/MoisesRodriguesSouza/FlutterLandPage',
    ),
  ];

  const ProjectsSection({super.key});

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
                  childAspectRatio: 0.9, // Ajusta a proporção dos itens
                ),
                itemCount: projects.length, // Usa o tamanho da lista de projetos
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCard(
                    projectName: project.name,
                    description: project.description,
                    imageUrl: project.imageUrl,
                    projectUrl: project.projectUrl, // Passa a URL do projeto
                    project: project, // Passa o objeto Project completo
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