import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/hireworker/models/work_post.dart';
import 'package:whatsapp/agrixpert/hireworker/screens/farmer/create_farmer_post_screen.dart';
import 'package:whatsapp/agrixpert/hireworker/screens/worker/create_worker_post_screen.dart';
import 'package:whatsapp/agrixpert/hireworker/widgets/work_post_card.dart';
import 'package:whatsapp/agrixpert/hireworker/widgets/worker_post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WorkPost> _workPosts = [
    WorkPost(
      title: 'Need Help Harvesting Maize',
      description:
          'Looking for a few strong individuals to help harvest maize on our 5-acre farm.',
      location: ' недалеко от Victoria Falls',
      payment: 'USD 10 per day',
      taskType: 'Harvesting',
    ),
    WorkPost(
      title: 'Assistance with Planting Tomatoes',
      description:
          'We need help planting tomato seedlings next week. Experience preferred but not required.',
      location: ' примерно 30 км от Victoria Falls',
      payment: 'USD 8 per day',
      taskType: 'Planting',
    ),
  ];

  final List<WorkerPost> _workerPosts = [
    WorkerPost(
      name: 'John Doe',
      skills: ['Sowing', 'Watering', 'Harvesting'],
      availability: 'Monday to Friday',
      location: 'Victoria Falls area',
      rate: 'USD 5 per hour',
    ),
    WorkerPost(
      name: 'Jane Smith',
      skills: ['Tilling', 'Planting'],
      availability: 'Weekends',
      location: 'Surrounding farms',
      rate: 'USD 4 per hour',
    ),
  ];

  List<WorkPost> _filteredWorkPosts = [];
  List<WorkerPost> _filteredWorkerPosts = [];
  String? _filterTaskType;
  String? _filterLocation;

  @override
  void initState() {
    super.initState();
    _filteredWorkPosts.addAll(_workPosts);
    _filteredWorkerPosts.addAll(_workerPosts);
  }

  void _filterWorkPosts() {
    setState(() {
      _filteredWorkPosts =
          _workPosts.where((post) {
            bool taskMatch =
                _filterTaskType == null || post.taskType == _filterTaskType;
            bool locationMatch =
                _filterLocation == null ||
                post.location.toLowerCase().contains(
                  _filterLocation!.toLowerCase(),
                );
            return taskMatch && locationMatch;
          }).toList();
    });
  }

  void _filterWorkerPosts() {
    setState(() {
      _filteredWorkerPosts =
          _workerPosts.where((post) {
            bool skillMatch =
                _filterTaskType == null ||
                post.skills.any(
                  (skill) =>
                      skill.toLowerCase() == _filterTaskType!.toLowerCase(),
                );
            bool locationMatch =
                _filterLocation == null ||
                post.location.toLowerCase().contains(
                  _filterLocation!.toLowerCase(),
                );
            return skillMatch && locationMatch;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Farm Connect')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Task Type'),
                    value: _filterTaskType,
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
                              (String? value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value ?? 'All'),
                              ),
                            )
                            .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _filterTaskType = newValue;
                        _filterWorkPosts();
                        _filterWorkerPosts();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Location'),
                    onChanged: (value) {
                      setState(() {
                        _filterLocation = value;
                        _filterWorkPosts();
                        _filterWorkerPosts();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Available Work',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _filteredWorkPosts.isEmpty
                ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('No work available based on your filters.'),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredWorkPosts.length,
                  itemBuilder: (context, index) {
                    final post = _filteredWorkPosts[index];
                    return WorkPostCard(post: post);
                  },
                ),
            const SizedBox(height: 20),
            const Text(
              'Available Workers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _filteredWorkerPosts.isEmpty
                ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('No workers available based on your filters.'),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredWorkerPosts.length,
                  itemBuilder: (context, index) {
                    final worker = _filteredWorkerPosts[index];
                    return WorkerPostCard(worker: worker);
                  },
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostSelectionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostSelectionScreen extends StatelessWidget {
  const PostSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateFarmerPostScreen(),
                  ),
                );
              },
              child: const Text('Create Farmer Post'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateWorkerPostScreen(),
                  ),
                );
              },
              child: const Text('Create Worker Post'),
            ),
          ],
        ),
      ),
    );
  }
}
