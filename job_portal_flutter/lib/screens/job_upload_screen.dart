import 'package:flutter/material.dart';
import '../models/job.dart';

class JobUploadScreen extends StatefulWidget {
  final Function(Job) onJobUploaded;

  const JobUploadScreen({Key? key, required this.onJobUploaded}) : super(key: key);

  @override
  _JobUploadScreenState createState() => _JobUploadScreenState();
}

class _JobUploadScreenState extends State<JobUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _company = '';
  String _location = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload New Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the job title';
                  }
                  return null;
                },
                onSaved: (value) => _title = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
                onSaved: (value) => _company = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the job location';
                  }
                  return null;
                },
                onSaved: (value) => _location = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Description'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the job description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final newJob = Job(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: _title,
                      company: _company,
                      location: _location,
                      description: _description,
                    );
                    widget.onJobUploaded(newJob);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Upload Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
