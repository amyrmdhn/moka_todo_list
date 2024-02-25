import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: getProportionateScreenHeight(250),
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
