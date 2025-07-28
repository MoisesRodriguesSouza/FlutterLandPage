// lib/widgets/skill_chip.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landpageti/constants/app_colors.dart';

class SkillChip extends StatelessWidget {
  final String skillName;
  final double proficiency; // 0.0 a 1.0
  final String? iconPath;

  const SkillChip({
    super.key,
    required this.skillName,
    required this.proficiency,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(
          0.1,
        ), // Fundo suave da cor primária
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.primary, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null) ...[
            // Exemplo: usar um ícone local ou um ícone do Material
            // Para ícones locais, você precisaria declará-los no pubspec.yaml
            // e ter os arquivos na pasta assets/icons.
            // Por simplicidade, usaremos um ícone genérico ou um placeholder.
            Icon(
              Icons.code,
              size: 18,
              color: AppColors.primaryDark,
            ), // Ícone genérico
            const SizedBox(width: 8.0),
          ],
          Text(
            skillName,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 8.0),
          // Barra de progresso visual (opcional, pode ser mais complexo com animação)
          SizedBox(
            width: 50, // Largura fixa para a barra
            child: LinearProgressIndicator(
              value: proficiency,
              backgroundColor: AppColors.primary.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryDark,
              ),
              minHeight: 5,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
