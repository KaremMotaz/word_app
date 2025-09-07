import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:hive_app/view/styles/color_manager.dart';
import 'package:hive_app/view/widgets/filter_section.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        final cubit = ReadDataCubit.get(context);

        return Dialog(
          backgroundColor: ColorManager.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FilterSection(
                  label: "Language",
                  labels: const ["Arabic", "English", "All"],
                  onTaps: [
                    () => cubit.updateLanguageFilter(LanguageFilter.arabicOnly),
                    () =>
                        cubit.updateLanguageFilter(LanguageFilter.englishOnly),
                    () => cubit.updateLanguageFilter(LanguageFilter.allWords),
                  ],
                  conditions: [
                    cubit.languageFilter == LanguageFilter.arabicOnly,
                    cubit.languageFilter == LanguageFilter.englishOnly,
                    cubit.languageFilter == LanguageFilter.allWords,
                  ],
                ),
                SizedBox(height: 10),
                FilterSection(
                  label: "Sorted By",
                  labels: const ["Time", "Word Length"],
                  onTaps: [
                    () => cubit.updateSortedBy(SortedBy.time),
                    () => cubit.updateSortedBy(SortedBy.wordLength),
                  ],
                  conditions: [
                    cubit.sortedBy == SortedBy.time,
                    cubit.sortedBy == SortedBy.wordLength,
                  ],
                ),
                SizedBox(height: 10),
                FilterSection(
                  label: "Sorting Type",
                  labels: const ["Ascending", "Descending"],
                  onTaps: [
                    () => cubit.updateSortingType(SortingType.ascending),
                    () => cubit.updateSortingType(SortingType.descending),
                  ],
                  conditions: [
                    cubit.sortingType == SortingType.ascending,
                    cubit.sortingType == SortingType.descending,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
