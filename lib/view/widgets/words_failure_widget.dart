import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/exception_widget.dart';

class WordsFailureWidget extends StatelessWidget {
  const WordsFailureWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return ExceptionWidget(iconData: Icons.error, message: message);
  }
}
