import 'package:flutter/material.dart';

class CreateFarmerPostScreen extends StatefulWidget {
  const CreateFarmerPostScreen({super.key});

  @override
  State<CreateFarmerPostScreen> createState() => _CreateFarmerPostScreenState();
}

class _CreateFarmerPostScreenState extends State<CreateFarmerPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _paymentController = TextEditingController();
  String? _taskType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Work Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Task Type'),
                value: _taskType,
                items:
                    <String>[
                          'Planting',
                          'Harvesting',
                          'Tilling',
                          'Sowing',
                          'Watering',
                          'Irrigation',
                        ]
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _taskType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a task type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _paymentController,
                decoration: const InputDecoration(labelText: 'Payment'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the payment amount';
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
                      const SnackBar(content: Text('Work post submitted!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Post Work'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
