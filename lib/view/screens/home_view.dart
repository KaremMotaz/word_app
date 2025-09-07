import 'package:flutter/material.dart';
import 'package:hive_app/view/widgets/add_floating_action_button.dart';
import 'package:hive_app/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      floatingActionButton: AddFloatingActionButton(),
      body: HomeViewBody(),
    );
  }
}
