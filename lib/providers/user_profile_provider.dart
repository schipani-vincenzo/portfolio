
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/user_profile.dart';

final userProfileProvider = Provider<UserProfile>((ref) {
  return const UserProfile(
    name: "Vincenzo Schipani",
    role: "Mobile Team Lead & Agile",
    location: "Naples, Italy",
    email: "schipani.digital@gmail.com",
    bio:
    "As an experienced Mobile Team Lead, I bring strong critical thinking and problem-solving skills essential for thriving in today’s dynamic tech landscape. My leadership is grounded in Agile methodologies, enabling seamless alignment with evolving project requirements and efficient team management. I excel at navigating complex challenges, consistently guiding my team to deliver high-quality, innovative mobile solutions with agility and precision.",
    projectsCompleted: 200,
    startupsRaised: 50,
    engagementGrowth: 120.0,
    yearsExperience: '10',
    coffeCups: '6'
  );
});
