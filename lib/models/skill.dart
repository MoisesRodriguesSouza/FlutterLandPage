// lib/models/skill.dart
class Skill {
  final String name;
  final double proficiency; // Proficiência de 0.0 a 1.0 (ou 0 a 100)
  final String? iconPath; // Caminho para um ícone local ou URL

  const Skill({required this.name, required this.proficiency, this.iconPath});
}
