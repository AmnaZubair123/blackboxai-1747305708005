import 'package:flutter/material.dart';
import '../models/job.dart';
import 'application_form_screen.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  const JobDetailScreen({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.company,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              job.location,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              job.description,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApplicationFormScreen(job: job),
                    ),
                  );
                },
                child: Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
