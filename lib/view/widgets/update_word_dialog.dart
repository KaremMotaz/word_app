import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/view/widgets/app_text_button.dart';
import 'package:hive_app/view/widgets/build_snack_bar.dart';
import 'package:hive_app/view/widgets/custom_form.dart';
import 'package:hive_app/view/widgets/language_filter_widget.dart';

class UpdateWordDialog extends StatefulWidget {
  const UpdateWordDialog({
    super.key,
    required this.isExample,
    required this.colorCode,
    required this.indexAtDatabase,
  });
  final bool isExample;
  final int colorCode;
  final int indexAtDatabase;

  @override
  State<UpdateWordDialog> createState() => _UpdateWordDialogState();
}

class _UpdateWordDialogState extends State<UpdateWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final WriteDataCubit cubit = WriteDataCubit.get(context);
    return BlocConsumer<WriteDataCubit, WriteDataState>(
      listener: (context, state) {
        if (state is WriteDataSuccessState) {
          Navigator.pop(context);
        } else if (state is WriteDataFailureState) {
          errorSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Dialog(
          backgroundColor: Color(widget.colorCode),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LanguageFilterWidget(
                  isArabicSelected: cubit.isArabic,
                  activeColorCode: widget.colorCode,
                ),
                SizedBox(height: 20),
                CustomForm(
                  label: widget.isExample ? "New Example" : "New Similar Word",
                  formKey: formKey,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppTextButton(
                    buttonText: "Done",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.isExample
                            ? cubit.addExample(
                                indexAtDatabase: widget.indexAtDatabase,
                              )
                            : cubit.addSimilarWord(
                                indexAtDatabase: widget.indexAtDatabase,
                              );
                      }
                    },
                    buttonWidth: 40,
                    buttonHeight: 50,
                    textStyle: TextStyle(
                      color: Color(widget.colorCode),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
