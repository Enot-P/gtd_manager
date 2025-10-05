import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/domain.dart';
import 'package:gtd_manager/features/notes/notes.dart';

class BottomSheetCreateNote extends StatefulWidget {
  const BottomSheetCreateNote({
    super.key,
    required this.noteCategory,
    this.errorInputField,
  });
  final NoteCategory noteCategory;
  final String? errorInputField;

  @override
  State<BottomSheetCreateNote> createState() => _BottomSheetCreateNoteState();
}

class _BottomSheetCreateNoteState extends State<BottomSheetCreateNote> {
  final noteTitleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _onSubmittedTap(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final bloc = context.read<ListNoteBloc>();
      bloc.add(
        ListNoteEvent.createNote(
          // ? Должно ли быть тут DTO или передавать параметры по отдельности и создавать его уже в блоке?
          NoteDtoCreate(
            title: noteTitleController.text.trim(),
            noteCategory: widget.noteCategory,
          ),
        ),
      );
      noteTitleController.clear();
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NoteInputNameWidget(
                noteCategory: widget.noteCategory,
                noteTitleController: noteTitleController,
              ),
              _NoteSettingsWidget(
                noteCategory: widget.noteCategory,
                noteTitleController: noteTitleController,
                onSubmittedTap: () => _onSubmittedTap(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
    return TextFormField(
      focusNode: focusNode,
      autofocus: true,
      maxLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Поле не должно быть пустым';
        }
        return null;
      },
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
      // onSubmitted: (text) {
      //   // noteTitleController.text = text;
      //   _onSubmittedTap(noteTitleController, context, noteCategory);
      // },
    );
  }
}

class _NoteSettingsWidget extends StatelessWidget {
  const _NoteSettingsWidget({
    required this.noteCategory,
    required this.noteTitleController,
    required this.onSubmittedTap,
  });

  final NoteCategory noteCategory;
  final TextEditingController noteTitleController;
  final VoidCallback onSubmittedTap;

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
          onSubmittedTap: onSubmittedTap,
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
  const _CreateNoteWidget({
    required this.noteCategory,
    required this.noteTitleController,
    required this.onSubmittedTap,
  });

  final NoteCategory noteCategory;
  final TextEditingController noteTitleController;
  final VoidCallback onSubmittedTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onSubmittedTap,
      icon: const Icon(Icons.send),
    );
  }
}
