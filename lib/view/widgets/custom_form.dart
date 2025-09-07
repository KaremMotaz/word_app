import 'package:flutter/material.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/view/styles/color_manager.dart';
import 'package:hive_app/view/widgets/app_text_form_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.label,
    required this.formKey,
  });
  final String label;
  final GlobalKey<FormState> formKey;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: AppTextFormField(
        hintText: widget.label,
        controller: controller,
        validator: (value) {
          return _validator(value, WriteDataCubit.get(context).isArabic);
        },
        onChanged: (value) {
          WriteDataCubit.get(context).updateText(text: value);
        },
        backgroundColor: ColorManager.transparent,
        label: widget.label,
      ),
    );
  }
}

String? _validator(String? value, bool isArabic) {
  if (value == null || value.trim().isEmpty) {
    return "This field must not be empty.";
  }

  final characters = value.runes.toList();

  for (var i = 0; i < characters.length; i++) {
    final charType = _getCharType(characters[i]);

    if (charType == CharType.notValid) {
      return "Character number ${i + 1} is not valid.";
    } 
    if (charType == CharType.arabic && !isArabic) {
      return "Character number ${i + 1} must be English.";
    } 
    if (charType == CharType.english && isArabic) {
      return "Character number ${i + 1} must be Arabic.";
    }
  }

  return null; 
}

CharType _getCharType(int code) {
  const int englishUpperStart = 65;
  const int englishUpperEnd = 90;
  const int englishLowerStart = 97;
  const int englishLowerEnd = 122;

  const int arabicStart = 0x0621; // 1569
  const int arabicEnd = 0x064A;   // 1610

  if ((code >= englishUpperStart && code <= englishUpperEnd) ||
      (code >= englishLowerStart && code <= englishLowerEnd)) {
    return CharType.english;
  } else if (code >= arabicStart && code <= arabicEnd) {
    return CharType.arabic;
  } else if (code == 32) {
    return CharType.space;
  }
  return CharType.notValid;
}

enum CharType { arabic, english, space, notValid }

