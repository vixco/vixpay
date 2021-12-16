import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

class DefaultErrorBuilder extends StatelessWidget {
  const DefaultErrorBuilder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.getString('fail_to_fetch_posts')),
    );
  }
}
