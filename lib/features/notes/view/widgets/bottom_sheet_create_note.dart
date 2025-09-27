import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/domain.dart';
import 'package:gtd_manager/features/notes/notes.dart';

class BottomSheetCreateNote extends StatelessWidget {
  const BottomSheetCreateNote({
    super.key,
    required this.noteCategory,
    this.errorInputField,
  });
  final NoteCategory noteCategory;
  final String? errorInputField;
  @override
  Widget build(BuildContext context) {
    // TODO: Как валидировать ошибку?
    final noteTitleController = TextEditingController(); // лучше не в билде
    final FocusNode focus;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NoteInputNameWidget(
              noteCategory: noteCategory,
              noteTitleController: noteTitleController,
            ),
            _NoteSettingsWidget(
              noteCategory: noteCategory,
              noteTitleController: noteTitleController,
              errorInputField: errorInputField,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Валидация ошибки, как сделать?!
void _onSubmittedTap(TextEditingController noteTitleController, BuildContext context, NoteCategory noteCategory) {
  final bloc = context.read<ListNoteBloc>();
  bloc.add(
    ListNoteEvent.createNote(
      NoteEntity(title: noteTitleController.text.trim(), noteCategory: noteCategory),
    ),
  );
  noteTitleController.clear();
  // Navigator.pop(context);
}

class _NoteInputNameWidget extends StatelessWidget {
  const _NoteInputNameWidget({
    required this.noteCategory,
    required this.noteTitleController,
  });
  final NoteCategory noteCategory;
  final TextEditingController noteTitleController;

  @override
  Widget build(BuildContext context) {
    // Чтобы клавиатура не закрывалась после создание заметки
    final focusNode = FocusNode();
    return TextField(
      focusNode: focusNode,
      autofocus: true,
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Новая задача',
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/arrows_more_up.png',
          ),
        ),
      ),
      style: const TextStyle(fontSize: 18),
      controller: noteTitleController,
      onSubmitted: (text) {
        // noteTitleController.text = text;
        _onSubmittedTap(noteTitleController, context, noteCategory);
      },
    );
  }
}

class _NoteSettingsWidget extends StatelessWidget {
  const _NoteSettingsWidget({
    required this.noteCategory,
    required this.noteTitleController,
    this.errorInputField,
  });

  final NoteCategory noteCategory;
  final TextEditingController noteTitleController;
  final String? errorInputField;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        const _SetDataTimeWidget(),
        const _SetTagButtonWidget(),
        const _SetProjectButtonWidget(),
        const Expanded(child: SizedBox()),
        _CreateNoteWidget(
          noteCategory: noteCategory,
          noteTitleController: noteTitleController,
        ),
        const SizedBox(width: 0),
      ],
    );
  }
}

class _SetDataTimeWidget extends StatelessWidget {
  const _SetDataTimeWidget();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      icon: const Icon(Icons.calendar_today),
    );
  }
}

class _SetProjectButtonWidget extends StatelessWidget {
  const _SetProjectButtonWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Text('Без проекта'),
    );
  }
}

class _SetTagButtonWidget extends StatelessWidget {
  const _SetTagButtonWidget();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      icon: const Icon(Icons.sell_outlined),
    );
  }
}

// TODO: ДОДЕЛАТЬ
class _CreateNoteWidget extends StatelessWidget {
  _CreateNoteWidget({
    required this.noteCategory,
    required this.noteTitleController,
  });

  final NoteCategory noteCategory;
  final TextEditingController noteTitleController;
  late final String? errorInputField;

  @override
  Widget build(BuildContext context) {
    final listNoteBloc = context.read<ListNoteBloc>();

    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => _onSubmittedTap(noteTitleController, context, noteCategory),
      icon: const Icon(Icons.send),
    );
  }
}
