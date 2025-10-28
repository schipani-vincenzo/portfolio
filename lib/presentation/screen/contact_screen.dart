import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/contact_item.dart';

class ContactScreen extends ConsumerWidget {
  final Function(String section)? onSectionSelected;

  const ContactScreen({super.key, this.onSectionSelected});

  Future<void> _launchUrl(String? url, BuildContext context) async {
    if (url == null || url.isEmpty) {
      debugPrint('URL is null or empty. Cannot launch.');
      return;
    }
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
      // Puoi aggiungere un messaggio all'utente qui, ad esempio con uno SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossibile aprire il link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactProvider);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'Contact me',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: isMobile ? TextAlign.start : TextAlign.center,
              ),
              const SizedBox(height: 16),
              Wrap(
                alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: contacts
                    .where((c) => c.value != null && c.value!.isNotEmpty)
                    .map((c) => GestureDetector(
                  onTap: c.url != null ? () => _launchUrl(c.url!, context) : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(c.icon,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        c.value!,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}