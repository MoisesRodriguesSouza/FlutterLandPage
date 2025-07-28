// lib/widgets/contact_section.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir links externos

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Função auxiliar para lançar URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // TODO: Adicionar um feedback visual para o usuário se o link não puder ser aberto
      debugPrint('Não foi possível abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(40.0),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: <Widget>[
            // Tamanho da fonte responsivo para o título da seção
            Text(
              'Contato',
              style: TextStyle(
                fontSize: screenSize.width > 600 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ficarei feliz em conversar sobre novas oportunidades ou projetos. Sinta-se à vontade para entrar em contato através dos seguintes canais:',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blueGrey),
              title: const Text(
                'moises.souza@al.infnet.edu.br',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => _launchUrl(
                'mailto:moises.souza@al.infnet.edu.br',
              ), // Email atualizado
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blueGrey),
              title: const Text(
                '+55 (21) 99190-1488',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () =>
                  _launchUrl('tel:+5521991901488'), // Telefone atualizado
            ),
            ListTile(
              leading: const Icon(Icons.link, color: Colors.blueGrey),
              title: const Text(
                'linkedin.com/in/seuperfil',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => _launchUrl('https://linkedin.com/in/seuperfil'),
            ),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.blueGrey),
              title: const Text(
                'github.com/seugithub',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => _launchUrl('https://github.com/seugithub'),
            ),
          ],
        ),
      ),
    );
  }
}
