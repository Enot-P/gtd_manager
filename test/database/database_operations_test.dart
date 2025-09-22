import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gtd_manager/app/database/database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DatabaseConfigure database;
  late DatabaseOperations dbOperations;

  setUp(() async {
    // Создаем базу данных в памяти для тестов
    database = DatabaseConfigure(NativeDatabase.memory());

    // Передаем тестовую базу в DatabaseOperations
    dbOperations = DatabaseOperations(database);

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

      // Act
      await dbOperations.createNote(
        title: title,
        noteCategory: category,
        description: description,
      );

      // Assert
      final notes = await dbOperations.getAllNotes();
      expect(notes.length, 1);
      expect(notes.first.title, title);
      expect(notes.first.noteCategory, category);
      expect(notes.first.description, description);
      expect(notes.first.projectId, isNull);
      expect(notes.first.createdAt, isNotNull);
    });

    test('createNote - создание заметки с проектом', () async {
      // Arrange
      const title = 'Заметка с проектом';
      const category = NoteCategory.next;
      const description = 'Описание';

      // Сначала создаем проект
      final projectId = await database
          .into(database.project)
          .insert(
            ProjectCompanion.insert(
              title: 'Тестовый проект',
              description: const Value('Описание проекта'),
              status: ProjectStatus.inProgress,
            ),
          );

      // Act
      await dbOperations.createNote(
        title: title,
        noteCategory: category,
        description: description,
        projectId: projectId,
      );

      // Assert
      final notes = await dbOperations.getAllNotes();
      expect(notes.length, 1);
      expect(notes.first.title, title);
      expect(notes.first.noteCategory, category);
      expect(notes.first.description, description);
      expect(notes.first.projectId, projectId);
    });

    test('getAllNotes - получение всех заметок', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Заметка 1',
        noteCategory: NoteCategory.inbox,
      );
      await dbOperations.createNote(
        title: 'Заметка 2',
        noteCategory: NoteCategory.next,
      );

      // Act
      final notes = await dbOperations.getAllNotes();

      // Assert
      expect(notes.length, 2);
      expect(notes.map((n) => n.title), containsAll(['Заметка 1', 'Заметка 2']));
    });

    test('getNoteById - получение заметки по ID', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Тестовая заметка',
        noteCategory: NoteCategory.inbox,
      );
      final notes = await dbOperations.getAllNotes();
      final noteId = notes.first.id;

      // Act
      final note = await dbOperations.getNoteById(noteId);

      // Assert
      expect(note.id, noteId);
      expect(note.title, 'Тестовая заметка');
      expect(note.noteCategory, NoteCategory.inbox);
    });

    test('getNotesByCategory - получение заметок по noteCategory', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Тестовая заметка',
        noteCategory: NoteCategory.inbox,
      );

      await dbOperations.createNote(
        title: 'Тестовая заметка2',
        noteCategory: NoteCategory.next,
      );

      // Act
      final note = await dbOperations.getNotesByCategory(NoteCategory.next);
      final listNotesLength = note.length;

      // Assert
      expect(listNotesLength, 1);
      expect(note.first.noteCategory, NoteCategory.next);
    });

    test('getNoteById - получение несуществующей заметки вызывает исключение', () async {
      // Act & Assert
      expect(
        () => dbOperations.getNoteById(999),
        throwsA(isA<StateError>()),
      );
    });

    test('updateNote - полное обновление заметки', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Исходная заметка',
        noteCategory: NoteCategory.inbox,
        description: 'Исходное описание',
      );
      final notes = await dbOperations.getAllNotes();
      final noteId = notes.first.id;

      // Act
      await dbOperations.updateNote(
        id: noteId,
        title: 'Обновленная заметка',
        category: NoteCategory.next,
        description: 'Обновленное описание',
      );

      // Assert
      final updatedNote = await dbOperations.getNoteById(noteId);
      expect(updatedNote.title, 'Обновленная заметка');
      expect(updatedNote.noteCategory, NoteCategory.next);
      expect(updatedNote.description, 'Обновленное описание');
      expect(updatedNote.updatedAt, isNotNull);
    });

    test('updateNote - частичное обновление заметки', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Исходная заметка',
        noteCategory: NoteCategory.inbox,
        description: 'Исходное описание',
      );
      final notes = await dbOperations.getAllNotes();
      final noteId = notes.first.id;

      // Act
      await dbOperations.updateNote(
        id: noteId,
        title: 'Обновленная заметка',
        category: null, // Не обновляем категорию
        description: null, // Не обновляем описание
      );

      // Assert
      final updatedNote = await dbOperations.getNoteById(noteId);
      expect(updatedNote.title, 'Обновленная заметка');
      expect(updatedNote.noteCategory, NoteCategory.inbox); // Остается прежней
      expect(updatedNote.description, 'Исходное описание'); // Остается прежним
      expect(updatedNote.updatedAt, isNotNull);
    });

    test('updateNote - обновление только проекта', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Заметка',
        noteCategory: NoteCategory.inbox,
        description: 'Описание',
      );
      final notes = await dbOperations.getAllNotes();
      final noteId = notes.first.id;

      // Создаем проект
      final projectId = await database
          .into(database.project)
          .insert(
            ProjectCompanion.insert(
              title: 'Новый проект',
              description: const Value('Описание'),
              status: ProjectStatus.inProgress,
            ),
          );

      // Act
      await dbOperations.updateNote(
        id: noteId,
        title: null,
        category: null,
        description: null,
        projectId: projectId,
      );

      // Assert
      final updatedNote = await dbOperations.getNoteById(noteId);
      expect(updatedNote.title, 'Заметка'); // Остается прежним
      expect(updatedNote.noteCategory, NoteCategory.inbox); // Остается прежним
      expect(updatedNote.description, 'Описание'); // Остается прежним
      expect(updatedNote.projectId, projectId); // Обновлен
      expect(updatedNote.updatedAt, isNotNull);
    });

    test('deleteNoteById - удаление заметки', () async {
      // Arrange
      await dbOperations.createNote(
        title: 'Заметка для удаления',
        noteCategory: NoteCategory.inbox,
      );
      final notes = await dbOperations.getAllNotes();
      final noteId = notes.first.id;

      // Act
      await dbOperations.deleteNoteById(noteId);

      // Assert
      final remainingNotes = await dbOperations.getAllNotes();
      expect(remainingNotes.length, 0);
    });

    test('deleteNoteById - удаление несуществующей заметки', () async {
      // Act & Assert - не должно вызывать исключение
      await dbOperations.deleteNoteById(999);

      // Проверяем, что заметок нет
      final notes = await dbOperations.getAllNotes();
      expect(notes.length, 0);
    });

    test('валидация - пустой заголовок заметки', () async {
      // Act & Assert
      expect(
        () => dbOperations.createNote(
          title: '',
          noteCategory: NoteCategory.inbox,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('валидация - слишком длинный заголовок заметки', () async {
      // Arrange
      final longTitle = 'A' * 101; // Превышает максимальную длину

      // Act & Assert
      expect(
        () => dbOperations.createNote(
          title: longTitle,
          noteCategory: NoteCategory.inbox,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('интеграционный тест - полный цикл CRUD', () async {
      // Create
      await dbOperations.createNote(
        title: 'Интеграционная заметка',
        noteCategory: NoteCategory.inbox,
        description: 'Тестовое описание',
      );

      // Read
      final notes = await dbOperations.getAllNotes();
      expect(notes.length, 1);
      final noteId = notes.first.id;

      // Update
      await dbOperations.updateNote(
        id: noteId,
        title: 'Обновленная интеграционная заметка',
        category: NoteCategory.next,
        description: 'Обновленное описание',
      );

      // Read again
      final updatedNote = await dbOperations.getNoteById(noteId);
      expect(updatedNote.title, 'Обновленная интеграционная заметка');
      expect(updatedNote.noteCategory, NoteCategory.next);
      expect(updatedNote.description, 'Обновленное описание');

      // Delete
      await dbOperations.deleteNoteById(noteId);

      // Read final
      final finalNotes = await dbOperations.getAllNotes();
      expect(finalNotes.length, 0);
    });
  });
}
