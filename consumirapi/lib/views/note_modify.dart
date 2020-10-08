import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget{
final String noteID;

bool get isEditing => noteID != null;

NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(noteID ==null ? 'Edit note':'Create note' )),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Note title'
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Note content'
            ),
          ),

          Container(height:16),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: RaisedButton(
              child: Text('Sumit',style: TextStyle(color: Colors.white)),
              color: Theme.of(context).primaryColor,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ]
      ),
    );
  }

}