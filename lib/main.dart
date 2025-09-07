import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/controller/read_data_cubit/read_data_cubit.dart';
import 'package:hive_app/controller/write_data_cubit/write_data_cubit.dart';
import 'package:hive_app/hive_constants.dart';
import 'package:hive_app/models/word_type_adapter.dart';
import 'package:hive_app/view/screens/home_view.dart';
import 'package:hive_app/view/styles/theme_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());
  await Hive.openBox(HiveConstants.wordsBox);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadDataCubit()..getWords()),
        BlocProvider(create: (context) => WriteDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getAppTheme(),
        home: const HomeView(),
      ),
    );
  }
}
