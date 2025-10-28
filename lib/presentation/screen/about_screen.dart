import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/user_profile.dart';
import '../../providers/user_profile_provider.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final isWide = MediaQuery.of(context).size.width > 800;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 48.0 : 24.0,
          vertical: 32.0,
        ),
        child: Column(
          crossAxisAlignment:
          isWide ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            // Parte principale About Me + Bullet punti
            isWide
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // About Me - espande per prendere spazio
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        profile.bio,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(height: 1.6),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                // Card immagine larghezza fissa
                Container(
                  width: 200,
                  child: _imageCard(profile),
                ),

                const SizedBox(width: 24),

                // Bullet points - espandono tutto lo spazio rimasto
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bulletPoint(
                        "With ${profile.yearsExperience}+ years of experience, I specialize in creating intuitive, user-focused designs that solve real-world problems.",
                      ),
                      const SizedBox(height: 16),
                      _bulletPoint(
                        "I thrive on working closely with clients, blending creativity with strategy.",
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  profile.bio,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(height: 1.6),
                ),
                const SizedBox(height: 24),
                _imageCard(profile),
                const SizedBox(height: 24),
                _bulletPoint(
                  "With ${profile.yearsExperience}+ years of experience, I specialize in creating intuitive, user-focused designs that solve real-world problems.",
                ),
                const SizedBox(height: 16),
                _bulletPoint(
                  "I thrive on working closely with clients, blending creativity with strategy.",
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Carosello statistiche - centrato sul web, padding su mobile
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Align(
                alignment: isWide ? Alignment.center : Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      _infoCard("${profile.yearsExperience}+", "Years Experience"),
                      _infoCard("${profile.projectsCompleted}", "Projects"),
                      _infoCard("${profile.startupsRaised}", "Startups Raised"),
                      _infoCard("${profile.engagementGrowth}%", "Growth Rate"),
                      _infoCard("${profile.coffeCups}+", "Coffees drunk "),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageCard(UserProfile profile) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: [
          const Icon(Icons.public, size: 32, color: Colors.black87),
          const SizedBox(height: 8),
          Text(
            "${profile.engagementGrowth}%",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Client engagement\nin 6 months",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/profile.png',
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Icon(Icons.check_circle, size: 18, color: Colors.black87),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String value, String label) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 16), // <-- qui aumentato
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
