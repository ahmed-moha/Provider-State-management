import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'home_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_)=>HomeProvider())
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    ),
  );
}
