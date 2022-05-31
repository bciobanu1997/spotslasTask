import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotlastask/mainscreen/mainscreen.dart';
import 'package:spotlastask/view_models/users_view_model.dart';
import 'package:spotlastask/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UsersViewModel())],
        child: GetMaterialApp(
          title: 'Spotlas',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: AppColors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: AppColors.white),
          ),
          home: const MainScreen(),
        ));
  }
}
