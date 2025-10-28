import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/experience.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  final Map<int, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    final experiences = ref.watch(experiencesProvider);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Experiences",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ...experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final e = entry.value;
            final isOpen = _expanded[i] ?? false;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() => _expanded[i] = !isOpen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(e.company,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                  Text('${e.startDate} — ${e.endDate}'),
                                  if (!isMobile && e.shortDescription != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        e.shortDescription!,
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: e.tags.map((tag) => Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Chip(
                                  label: Text(
                                    tag,
                                    style: TextStyle(
                                      fontSize: isMobile ? 12 : 14,
                                      color: tag == 'Branding'
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  backgroundColor: tag == 'Branding'
                                      ? Colors.grey[200]
                                      : Colors.black,
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: isMobile
                                      ? VisualDensity.compact
                                      : VisualDensity.standard,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: isMobile ? 2 : 4),
                                ),
                              )).toList(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (isOpen)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      e.fullDescription,
                      style: const TextStyle(height: 1.4),
                    ),
                  ),
                const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}