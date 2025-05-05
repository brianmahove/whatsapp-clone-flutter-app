class WorkerPost {
  final String name;
  final List<String> skills;
  final String availability;
  final String location;
  final String rate;

  WorkerPost({
    required this.name,
    required this.skills,
    required this.availability,
    required this.location,
    required this.rate,
  });
}

class WorkPost {
  final String title;
  final String description;
  final String location;
  final String payment;
  final String taskType;

  WorkPost({
    required this.title,
    required this.description,
    required this.location,
    required this.payment,
    required this.taskType,
  });
}
