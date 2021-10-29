import 'package:flutter/material.dart';

class ConditionalExpanded extends StatelessWidget {
  const ConditionalExpanded({
    Key? key,
    required this.child,
    required this.isExpanded,
  }) : super(key: key);

  final Widget child;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Expanded(child: child) : child;
  }
}
