
import 'package:go_router/go_router.dart';

import '../screen/top_screen.dart';
import '../screen/contact_screen.dart';
import '../screen/home_screen/home_screen.dart';
import '../screen/experience_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/about', builder: (context, state) =>  TopScreen()),
    GoRoute(path: '/portfolio', builder: (context, state) => const ExperienceScreen()),
    GoRoute(path: '/contact', builder: (context, state) => const ContactScreen()),
  ],
);
