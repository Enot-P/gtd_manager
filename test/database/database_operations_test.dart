import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/list_notes_repositories.dart';
import 'package:talker/talker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GtdDatabase database;
  late ListNotesRepository noteRepo;

  setUp(() async {
    // Создаем базу данных в памяти для тестов
    database = GtdDatabase(NativeDatabase.memory());
    noteRepo = ListNotesRepository(database);
    // Ждем инициализации базы данных
    await database.customSelect('SELECT 1').get();
  });

  tearDown(() async {
    await database.close();
  });

  group('DatabaseOperations - CRUD операции для заметок', () {
    test('createNote - создание заметки', () async {
      // Arrange
      const title = 'Тестовая заметка';
      const category = NoteCategory.inbox;
      const description = 'Описание тестовой заметки';
      const NoteEntity note = NoteEntity(
        title: title,
        noteCategory: category,
        description: description,
      );

      // Act
      await noteRepo.createNote(note);

      // Assert
      final notes = await noteRepo.getAllNotes();
      expect(notes.length, 1);
      expect(notes.first.title, title);
      expect(notes.first.noteCategory, category);
      expect(notes.first.description, description);
      expect(notes.first.projectId, isNull);
    });

    test('getNotesByCategory - Получение заметок по категориям', () async {
      const inboxTitle = 'Тестовая заметка в inbox';
      const inboxNote = NoteEntity(
        title: inboxTitle,
        noteCategory: NoteCategory.inbox,
      );
      const nextNote = NoteEntity(
        title: 'Тестовая заметка в next',
        noteCategory: NoteCategory.next,
      );
      await noteRepo.createNote(inboxNote);

      await noteRepo.createNote(nextNote);

      final notes = await noteRepo.getNotesByCategory(NoteCategory.inbox);
      expect(notes.length, 1);
      expect(notes.first.noteCategory, NoteCategory.inbox);
      expect(notes.first.title, inboxTitle);
    });

    test('getNoteById - Получение заметки по id', () async {
      const inboxTitle = 'Тестовая заметка в inbox';

      const inboxNote = NoteEntity(
        title: inboxTitle,
        noteCategory: NoteCategory.inbox,
      );
      await noteRepo.createNote(inboxNote);

      final note = await noteRepo.getNoteById(1);
      expect(inboxNote.copyWith(id: note.id), note);
    });
    test('updateNote - Обновление заметки ', () async {
      const inboxTitle = 'Тестовая заметка в inbox';
      const updatedTitle = 'Обновленная заметка в inbox';
      const description = 'Есть писание';

      const inboxNote = NoteEntity(
        title: inboxTitle,
        noteCategory: NoteCategory.inbox,
        description: description,
      );

      const updateParams = NoteEntity(
        title: updatedTitle,
        noteCategory: NoteCategory.next,
      );
      await noteRepo.createNote(inboxNote);
      // Для получения из бд с параметром ID
      final noteInDB = await noteRepo.getNoteById(1);
      final noteId = noteInDB.id;
      if (noteId != null) {
        await noteRepo.updateNote(
          noteId: noteId,
          newParamsNote: updateParams,
        );
      }

      final notes = await noteRepo.getAllNotes();
      Talker().debug(notes);
      expect(notes.length, 1);
      expect(notes.first.title, updatedTitle);
      expect(notes.first.noteCategory, NoteCategory.next);
      expect(notes.first.description, description);
    });

    test('deleteNote - Удалить заметку', () async {
      const inboxTitle = 'Тестовая заметка в inbox';
      const description = 'Есть писание';

      const inboxNote = NoteEntity(
        title: inboxTitle,
        noteCategory: NoteCategory.inbox,
        description: description,
      );
      await noteRepo.createNote(inboxNote);
      final notes = await noteRepo.getAllNotes();
      expect(notes.length, 1);
      await noteRepo.deleteNote(notes.first.id!);
      final newNotes = await noteRepo.getAllNotes();
      expect(newNotes.length, 0);
    });
  });
}
