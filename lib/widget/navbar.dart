import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(String section) onSectionSelected;
  final bool isFooter;

  const NavBar({
    super.key,
    required this.onSectionSelected,
    this.isFooter = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    final Color textColor = isFooter ? Colors.white : Colors.black;
    final Color iconColor = isFooter ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Logo (solo se non è footer)
          if (!isFooter)
            SizedBox(
              width: isMobile ? 100 : 200,
              height: isMobile ? 56 : 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          else
            const SizedBox(), // Per mantenere il layout simmetrico

          /// Menu
          if (isMobile)
            IconButton(
              icon: Icon(Icons.menu, color: iconColor),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: isFooter ? Colors.grey[900] : null,
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildNavItems(context, isMobile, textColor),
                  ),
                );
              },
            )
          else
            Row(
              children: _buildNavItems(context, isMobile, textColor),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(
      BuildContext context,
      bool isMobile,
      Color textColor,
      ) {
    final List<Map<String, String>> navItems = [
      {'label': 'Home', 'section': 'top'},
      {'label': 'About', 'section': 'about'},
      {'label': 'Experience', 'section': 'experience'},
      {'label': 'Contact', 'section': 'contact'},
    ];

    return navItems.map((item) {
      final label = item['label']!;
      final section = item['section']!;
      return isMobile
          ? ListTile(
        title: Text(label, style: TextStyle(color: textColor)),
        onTap: () {
          Navigator.of(context).pop();
          onSectionSelected(section);
        },
      )
          : TextButton(
        onPressed: () => onSectionSelected(section),
        child: Text(label, style: TextStyle(color: textColor)),
      );
    }).toList();
  }
}