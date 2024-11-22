import 'package:flourish/utils/bindings/bindings.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlourishApp());
}

class FlourishApp extends StatelessWidget {
  const FlourishApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetMaterialApp(
        getPages: routes,
        initialBinding: ControllerBinding(),
        title: 'Flourish',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme:
              ColorScheme.fromSeed(seedColor: bgColor, primary: bgColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
