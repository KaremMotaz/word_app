import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/exception_widget.dart';

class NoWordsWidget extends StatelessWidget {
  const NoWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExceptionWidget(
      iconData: Icons.list_rounded,
      message: "Empty Words List",
    );
  }
}
