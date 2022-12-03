import 'package:ahmed_rascic_tech387_flutter/constants/global_variables.dart';
import 'package:ahmed_rascic_tech387_flutter/providers/user_provider.dart';
import 'package:ahmed_rascic_tech387_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider()
        )
      ],
      
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone Tech387 arascic',
      
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,

        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),

      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
