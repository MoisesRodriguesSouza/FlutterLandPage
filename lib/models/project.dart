// lib/models/project.dart
class Project {
  final String name;
  final String description;
  final String
  longDescription; // Descrição mais detalhada para a página de detalhes
  final String imageUrl;
  final String? projectUrl;

  const Project({
    required this.name,
    required this.description,
    required this.longDescription, // Adicionado ao construtor
    required this.imageUrl,
    this.projectUrl,
  });
}
