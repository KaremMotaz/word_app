import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/view/widgets/app_text_button.dart';
import 'package:hive_app/view/widgets/build_snack_bar.dart';
import 'package:hive_app/view/widgets/colors_widget.dart';
import 'package:hive_app/view/widgets/custom_form.dart';
import 'package:hive_app/view/widgets/language_filter_widget.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            duration: const Duration(milliseconds: 750),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(WriteDataCubit.get(context).colorCode),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageFilterWidget(
                    isArabicSelected: WriteDataCubit.get(context).isArabic,
                    activeColorCode: WriteDataCubit.get(context).colorCode,
                  ),
                  SizedBox(height: 10),
                  ColorsWidget(
                    activeColorCode: WriteDataCubit.get(context).colorCode,
                  ),
                  SizedBox(height: 20),
                  CustomForm(label: "New Word", formKey: formKey),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppTextButton(
                      buttonText: "Done",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          WriteDataCubit.get(context).addWord();
                        }
                      },
                      buttonWidth: 40,
                      buttonHeight: 50,
                      textStyle: TextStyle(
                        color: Color(WriteDataCubit.get(context).colorCode),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
