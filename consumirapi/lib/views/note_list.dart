import 'package:consumirapi/models/note_for_listing.dart';
import 'package:consumirapi/services/notes_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'note_delete.dart';
import 'note_modify.dart';

class NoteList extends StatefulWidget{
  @override 
  _NoteListState createState() =>_NoteListState();
}

  class _NoteListState extends State<NoteList>{
  NotesService get service => GetIt.I<NotesService>();

  List<NoteForListing> notes = [];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override 
  void initState(){
    notes = service.getNotesList();
    super.initState();
  }


  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text('List of notes')),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => NoteModify()));

      },
      child: Icon(Icons.add),
    ),
    body: ListView.separated( 
      separatorBuilder: (_, __)=> Divider(height: 1,color: Colors.green),
      itemBuilder: (_, index){
        return Dismissible(
          key: ValueKey(notes[index].noteID),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction){
    
          },

          confirmDismiss: (direction) async {
            final result = await showDialog(
              context: context,
              builder: (_) => NoteDelete()
            );
            return result;
          },
          child: ListTile(
          title: Text(
            notes[index].noteTitle,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          subtitle: Text('Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
          onTap:(){
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID)));

          },
        ));    
      },
      itemCount: notes.length,
    ),
    );
}

}