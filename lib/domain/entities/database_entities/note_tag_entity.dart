import 'package:equatable/equatable.dart';

class NoteTagEntity extends Equatable {
  final int id;
  final int noteId;
  final int tagId;

  const NoteTagEntity({required this.id, required this.noteId, required this.tagId});

  @override
  List<Object?> get props => [id, noteId, tagId];
}
