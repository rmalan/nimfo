import 'package:flutter/material.dart';

class SynopsisTitle extends StatelessWidget {
  const SynopsisTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Text(
        'Synopsis',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
