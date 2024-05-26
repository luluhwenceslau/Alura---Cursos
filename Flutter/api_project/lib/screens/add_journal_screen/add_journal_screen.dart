import 'package:api_project/helpers/weekday.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget{
  final Journal journal;
   AddJournalScreen({Key? key, required this.journal}): super(key:key);

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: Icon(Icons.check_circle_outline),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 2.0),
        ),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) {
    String content = _contentController.text;

    journal.content = content;
    JournalService service = JournalService();
    service.register(journal).then((value) {
      Navigator.pop(context, value);
    });
  }
}