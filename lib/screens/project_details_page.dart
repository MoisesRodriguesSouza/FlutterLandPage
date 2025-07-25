// lib/screens/project_details_page.dart (NOVO ARQUIVO)
import 'package:flutter/material.dart';
import 'package:landpageti/models/project.dart'; // Importa o modelo Project
import 'package:url_launcher/url_launcher.dart'; // Para abrir links externos

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(project.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  project.imageUrl,
                  width: screenSize.width * 0.8, // Imagem maior na página de detalhes
                  height: screenSize.height * 0.9,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.9,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image, size: 80, color: Colors.grey)),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              project.name,
              style: TextStyle(fontSize: screenSize.width > 600 ? 40 : 30, fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                project.longDescription, // Usando a descrição longa
                style: const TextStyle(fontSize: 18, height: 1.6),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
            if (project.projectUrl != null)
              ElevatedButton.icon(
                onPressed: () => _launchUrl(project.projectUrl!),
                icon: const Icon(Icons.link),
                label: const Text('Visitar Projeto', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
