import 'package:flutter/material.dart';
import '../models/job.dart';
import 'job_detail_screen.dart';
import 'job_upload_screen.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<Job> jobs = [
    Job(
      id: 1,
      title: 'Software Engineer',
      company: 'Tech Corp',
      location: 'San Francisco, CA',
      description: 'Develop and maintain software applications.',
    ),
    Job(
      id: 2,
      title: 'Product Manager',
      company: 'Innovate Ltd',
      location: 'New York, NY',
      description: 'Lead product development teams.',
    ),
    Job(
      id: 3,
      title: 'UX Designer',
      company: 'Creative Studio',
      location: 'Remote',
      description: 'Design user experiences for mobile and web apps.',
    ),
  ];

  void _addJob(Job job) {
    setState(() {
      jobs.add(job);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return ListTile(
            title: Text(job.title),
            subtitle: Text('${job.company} - ${job.location}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: job),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobUploadScreen(onJobUploaded: _addJob),
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Upload New Job',
      ),
    );
  }
}
