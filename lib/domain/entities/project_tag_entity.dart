import 'package:equatable/equatable.dart';

class ProjectTagEntity extends Equatable {
  final int id;
  final int projectId;
  final int tagId;

  const ProjectTagEntity({required this.id, required this.projectId, required this.tagId});

  @override
  List<Object?> get props => [id, projectId, tagId];
}
