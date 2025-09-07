import 'dart:convert';

/// This class represents a single Task in the ToDo App
class ToDoModel {
  /// Unique identifier for each task
  final String id;

  /// Title or description of the task
  final String title;

  /// Whether the task is completed or not
  final bool isDone;

  /// Whether the task is deleted (soft delete) or not
  final bool isDeleted;

  /// Constructor to create a new ToDoModel object
  /// - [id] and [title] are required
  /// - [isDone] and [isDeleted] default to false
  ToDoModel({
    required this.id,
    required this.title,
    this.isDone = false,
    this.isDeleted = false,
  });

  /// Creates a new copy of the object with some updated fields
  /// Useful for immutability and state management (Cubit/Bloc)
  ToDoModel copyWith({bool? isDone, bool? isDeleted}) {
    return ToDoModel(
      id: id, // keep the same id
      title: title, // keep the same title
      isDone: isDone ?? this.isDone, // update if provided, else keep old value
      isDeleted: isDeleted ?? this.isDeleted, // same logic for isDeleted
    );
  }

  // Converts the object into a Map<String, dynamic>
  /// Useful for saving into databases or APIs
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  /// Creates an object from a Map
  /// Useful for reading data from databases or APIs
  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  /// Converts the object to a JSON string
  /// Uses [toMap] first then encodes it
  String toJson() => json.encode(toMap());

  /// Creates an object from a JSON string
  /// Decodes JSON into a Map, then uses [fromMap]
  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source));

  /// Override toString for easier debugging and printing
  @override
  String toString() {
    return 'ToDoModel(id: $id, title: $title, isDone: $isDone, isDeleted: $isDeleted)';
  }
}
