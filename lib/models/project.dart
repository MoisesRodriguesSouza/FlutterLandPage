// lib/models/project.dart
class Project {
  final String name;
  final String description;
  final String imageUrl;
  final String? projectUrl;

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.projectUrl,
  });
}