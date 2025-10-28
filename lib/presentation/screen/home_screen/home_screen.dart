import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/screen/top_screen.dart';
import 'package:portfolio/presentation/screen/contact_screen.dart';
import 'package:portfolio/presentation/screen/experience_screen.dart';
import '../../../widget/navbar.dart';
import '../../../widget/section_wrapper.dart';
import '../about_screen.dart';
import '../footer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  final topKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();


  void scrollToSection(String key) {
    final contextMap = {
      'top': topKey,
      'about': aboutKey,
      'experience': experienceKey,
      'contact': contactKey,
    };
    final sectionContext = contextMap[key]?.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NavBar(onSectionSelected: scrollToSection),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    SectionWrapper(
                      sectionKey: topKey,
                      child: const TopScreen(),
                      topPadding: isMobile ? 0.0 : 32.0,
                      bottomPadding: isMobile ? 0.0 : 32.0,
                    ),
                    SectionWrapper(
                      sectionKey: aboutKey,
                      child: const AboutScreen(),
                      topPadding: isMobile ? 0.0 : 16.0,
                      bottomPadding: isMobile ? 0.0 : 16.0,
                    ),
                    SectionWrapper(
                      sectionKey: experienceKey,
                      child: const ExperienceScreen(),
                    ),
                    SectionWrapper(
                      sectionKey: contactKey,
                      child: const ContactScreen(),
                      bottomPadding: 0.0,
                    ),
                    SectionWrapper(
                      child: FooterScreen(onSectionSelected: scrollToSection),
                      topPadding: 0.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
