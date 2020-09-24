import 'package:flutter/material.dart';
import 'package:instagram/src/pages/menu_page.dart';
import 'package:provider/provider.dart';

import 'models/providers/navegacion_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavegacionModel())],
      child: MaterialApp(
        title: 'Instagram',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xff181818),
            primaryColor: Color(0xff31323B)),
        home: MenuPage(),
      ),
    );
  }
}
