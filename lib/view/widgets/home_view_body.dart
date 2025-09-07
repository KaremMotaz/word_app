import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/filter_row.dart';
import 'package:hive_app/view/widgets/words_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [FilterRow(), WordsWidget()]),
    );
  }
}
