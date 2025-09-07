import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:hive_app/view/styles/color_manager.dart';

class LanguageFillterWidget extends StatelessWidget {
  const LanguageFillterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Text(
          _mapLanguageFilterEnumToString(
            ReadDataCubit.get(context).languageFilter,
          ),
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        );
      },
    );
  }

  String _mapLanguageFilterEnumToString(LanguageFilter languageFilter) {
    switch (languageFilter) {
      case LanguageFilter.allWords:
        return "All Words";
      case LanguageFilter.arabicOnly:
        return "Arabic Only";
      case LanguageFilter.englishOnly:
        return "English Only";
    }
  }
}
