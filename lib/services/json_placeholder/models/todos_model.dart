import 'package:equatable/equatable.dart';

class Todos extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}
