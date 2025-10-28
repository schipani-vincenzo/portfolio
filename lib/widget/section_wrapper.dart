import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Key? sectionKey;
  final double topPadding;
  final double bottomPadding;



  const SectionWrapper({
    super.key,
    this.sectionKey,
    this.topPadding = 32.0,
    this.bottomPadding = 32.0,
    required this.child});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 1920;

    return Align(
      alignment: Alignment.center,
      child: Container(
        key: sectionKey,
        width: isWide ? 1920 : double.infinity,
        //padding: EdgeInsets.fromLTRB(24.0, topPadding, 24.0, bottomPadding),
        child: child,
      ),
    );
  }
}