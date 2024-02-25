import 'package:flutter/material.dart';

import '../size_config.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}