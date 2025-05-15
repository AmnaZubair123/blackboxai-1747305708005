import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/job_list_screen.dart';

void main() {
  runApp(JobPortalApp());
}

class JobPortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: JobListScreen(),
    );
  }
}
