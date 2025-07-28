// lib/widgets/project_card.dart
import 'package:flutter/material.dart';
import 'package:landpageti/models/project.dart'; // Importa o modelo Project
import 'package:landpageti/screens/project_details_page.dart'; // Importa a nova página de detalhes
import 'package:url_launcher/url_launcher.dart'; // Para abrir links externos

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String description;
  final String imageUrl;
  final String? projectUrl;
  final Project project; // Adicionado o objeto Project completo

  const ProjectCard({
    super.key,
    required this.projectName,
    required this.description,
    required this.imageUrl,
    this.projectUrl,
    required this.project, // Requer o objeto Project
  });

  // Função auxiliar para lançar URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Altura da imagem baseada em uma proporção da largura da tela,
    // com limites para não ficar muito grande ou muito pequena.
    double imageDisplayHeight =
        screenSize.width * 0.25; // 25% da largura da tela como altura inicial
    if (imageDisplayHeight < 120) {
      // Altura mínima para mobile
      imageDisplayHeight = 120;
    } else if (imageDisplayHeight > 200) {
      // Altura máxima para desktop
      imageDisplayHeight = 200;
    }

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              height:
                  imageDisplayHeight, // Altura responsiva baseada em porcentagem e limites
              width: double.infinity,
              fit: BoxFit.fitWidth, // Usando BoxFit.fitWidth
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: imageDisplayHeight, // Altura responsiva
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  projectName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Navega para a página de detalhes, passando o objeto Project
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProjectDetailsPage(project: project),
                        ),
                      );
                    },
                    child: const Text(
                      'Ver Detalhes',
                    ), // Alterado para "Ver Detalhes"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
