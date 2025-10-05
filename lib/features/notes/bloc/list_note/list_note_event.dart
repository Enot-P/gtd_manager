part of 'list_note_bloc.dart';

@freezed
class ListNoteEvent with _$ListNoteEvent {
  const factory ListNoteEvent.loadNotes(NoteCategory noteCategory) = _LoadNotes;

  // ? Можно ли использовать DTO в state-менеджере?
  const factory ListNoteEvent.createNote(NoteDtoCreate note) = _CreateNote;

  const factory ListNoteEvent.deleteNote(int noteId) = _DeleteNote;

  /// noteId заметки которой хотем изменить категорию
  /// NoteCategory - категория на которую будем менять
  const factory ListNoteEvent.changeCategory(
    int noteId,
    NoteCategory noteCategory,
  ) = _ChangeNoteCategory;

  /// Меняет местами заметки по их параметру keyOrder
  const factory ListNoteEvent.changeNotesKeyOrder({
    required int firstKeyOrder,
    required int secondKeyOrder,
  }) = _ChangeNotesKeyOrder;
}
