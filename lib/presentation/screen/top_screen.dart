
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widget/animated_logo.dart';

class TopScreen extends ConsumerWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = kIsWeb && screenWidth > 600;

    final topSpacing = isWeb ? 64.0 : 0.0; // meno spazio in alto su mobile

    return SizedBox(
      height: isWeb ? MediaQuery.of(context).size.height : (MediaQuery.of(context).size.height * 2)/3,
      child: Stack(
        children: [
          // IMMAGINE DI SFONDO SPOSTATA A DESTRA
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/images/profile.png',
                width: isWeb ? screenWidth * 0.4 : screenWidth * 0.7,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // CONTENUTO TESTO IN PRIMO PIANO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: isWeb ? screenWidth * 0.5 : double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: topSpacing), // <-- spazio ridotto su mobile
                    const Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "— I'm Skip, mobile software developer",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: const [
                        StatBlock(label: '+200', subtitle: 'Project completed'),
                        SizedBox(width: 32),
                        StatBlock(label: '+50', subtitle: 'Startup raised'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // LINEA LATERALE E ANNO (solo web)
          if (isWeb)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 60,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        'Software Engineer',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    /*Text(
                      '2010',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),

          // "Scroll down" solo su web
          if (isWeb)
            Positioned(
              bottom: 100,
              left: 24,
              child: Row(
                children: [
                  Text(
                    'Scroll down',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


class StatBlock extends StatelessWidget {
  final String label;
  final String subtitle;

  const StatBlock({required this.label, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}