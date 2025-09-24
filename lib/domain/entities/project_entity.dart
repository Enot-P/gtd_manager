import 'package:equatable/equatable.dart';

// WARNING: Надо как-то сделать так, чтобы если я менял поле в бд, то менять надо было и здесь
// WARNING: Надо поменять сущности на Freezed

enum ProjectStatus { waiting, inProgress, done }

class ProjectEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final ProjectStatus projectStatus;
  final int? parentProjectId;

  const ProjectEntity({
    required this.id,
    required this.title,
    this.description,
    required this.projectStatus,
    this.parentProjectId,
  });

  @override
  List<Object?> get props => [id, title, description, projectStatus, parentProjectId];
}
