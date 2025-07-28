// lib/screens/portfolio_home_page.dart
import 'package:flutter/material.dart';
import 'package:landpageti/widgets/about_section.dart';
import 'package:landpageti/widgets/contact_section.dart';
import 'package:landpageti/widgets/footer_section.dart';
import 'package:landpageti/widgets/hero_section.dart';
import 'package:landpageti/widgets/projects_section.dart';
import 'package:landpageti/widgets/testimonials_section.dart'; // Importa a nova seção de depoimentos

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey(); // Chave para a nova seção
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset >= 400) {
          // Mostra o botão após rolar 400 pixels
          _showBackToTopButton = true;
        } else {
          _showBackToTopButton = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0, // Rola para o topo da seção
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moisés - Portfólio de TI'), // Nome atualizado
        centerTitle: true,
        // Responsividade do AppBar: mostra botões de navegação para telas maiores, Drawer para menores
        actions: screenSize.width > 600
            ? <Widget>[
                TextButton(
                  onPressed: () => _scrollToSection(_aboutKey),
                  child: const Text(
                    'Sobre Mim',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_projectsKey),
                  child: const Text(
                    'Meus Trabalhos',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      _scrollToSection(_testimonialsKey), // Adicionado
                  child: const Text(
                    'Depoimentos',
                    style: TextStyle(color: Colors.white),
                  ), // Adicionado
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  child: const Text(
                    'Contato',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]
            : null, // Se a tela for pequena, o Drawer será exibido
      ),
      // Drawer para navegação em telas menores (mobile)
      drawer: screenSize.width <= 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Text(
                      'Navegação',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text('Sobre Mim'),
                    onTap: () {
                      _scrollToSection(_aboutKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Meus Trabalhos'),
                    onTap: () {
                      _scrollToSection(_projectsKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Depoimentos'), // Adicionado
                    onTap: () {
                      _scrollToSection(_testimonialsKey); // Adicionado
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contato'),
                    onTap: () {
                      _scrollToSection(_contactKey);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            HeroSection(
              key: _heroKey,
              scrollToProjects: () => _scrollToSection(_projectsKey),
            ),
            AboutSection(key: _aboutKey),
            ProjectsSection(key: _projectsKey),
            TestimonialsSection(key: _testimonialsKey), // Nova seção
            ContactSection(key: _contactKey),
            const FooterSection(),
          ],
        ),
      ),
      // Botão "Voltar ao Topo" aparece e desaparece com a rolagem
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}
