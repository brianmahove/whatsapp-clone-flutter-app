import 'package:flutter/material.dart';

class CreateWorkerPostScreen extends StatefulWidget {
  const CreateWorkerPostScreen({super.key});

  @override
  State<CreateWorkerPostScreen> createState() => _CreateWorkerPostScreenState();
}

class _CreateWorkerPostScreenState extends State<CreateWorkerPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _skillsController = TextEditingController();
  final _availabilityController = TextEditingController();
  final _locationController = TextEditingController();
  final _rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Worker Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills (e.g., Sowing, Watering)',
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _availabilityController,
                decoration: const InputDecoration(
                  labelText: 'Availability (e.g., Monday to Friday)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your availability';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location(s) Available',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your available locations';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _rateController,
                decoration: const InputDecoration(
                  labelText: 'Hourly/Daily Rate',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your rate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // In a real app, you would send this data to your backend
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Worker profile created!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Post Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
