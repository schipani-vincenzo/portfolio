import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactItem {
  final String label;
  final String? value;
  final String icon;
  final String? url;

  ContactItem({
    required this.label,
    required this.icon,
    this.value,
    this.url,
  });
}

final contactProvider = Provider<List<ContactItem>>((ref) {
  return [
    ContactItem(
      label: 'Name',
      value: 'Vincenzo Schipani',
      icon: 'assets/images/contacts/ic_profile.png',
    ),
    ContactItem(
      label: 'Phone',
      value: '+39 3288012661',
      icon: 'assets/images/contacts/ic_phone.png',
      url: 'tel:++393288012661',
    ),
    ContactItem(
      label: 'Email',
      value: 'schipani.digital@gmail.com',
      icon: 'assets/images/contacts/ic_email.png',
      url: 'mailto:schipani.digital@gmail.com',
    ),
    ContactItem(
      label: 'Instagram',
      value: '@skip',
      icon: 'assets/images/contacts/ic_instagram.png',
      url: 'https://www.instagram.com/schipani.vincenzo/',
    ),
    ContactItem(
      label: 'LinkedIn',
      value: 'linkedin.com/in/vincenzo-schipani',
      icon: 'assets/images/contacts/ic_linkedin.png',
      url: 'https://www.linkedin.com/in/vincenzo-schipani-85345573/',
    ),
    ContactItem(
      label: 'GitHub',
      value: '',
      icon: 'assets/images/contacts/ic_github.png',
      url: '',
    ),
  ];
});