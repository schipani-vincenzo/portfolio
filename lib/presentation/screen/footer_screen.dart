import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/navbar.dart';

class FooterScreen extends StatelessWidget{
  final Function(String section)? onSectionSelected;

  const FooterScreen({super.key, this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return // Footer section using inverted NavBar
      Container(
        width: double.infinity,
        color: Colors.grey[900],
        child: NavBar(
          onSectionSelected: onSectionSelected ?? (_) {},
          isFooter: true,
        ),
      );
  }
}