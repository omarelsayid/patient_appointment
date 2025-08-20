import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/routes/routes_generator.dart';
import 'package:patient_appointment/core/services/shared_preferences_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PagesRoutes.splashView,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      title: 'Patient Appointment',
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
    );
  }
}
