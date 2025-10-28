class UserProfile {
  final String name;
  final String role;
  final String location;
  final String email;
  final String bio;
  final int projectsCompleted;
  final int startupsRaised;
  final double engagementGrowth;
  final String yearsExperience;
  final String? coffeCups;

  const UserProfile({
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.bio,
    required this.projectsCompleted,
    required this.startupsRaised,
    required this.engagementGrowth,
    required this.yearsExperience,
    required this.coffeCups,
  });
}
