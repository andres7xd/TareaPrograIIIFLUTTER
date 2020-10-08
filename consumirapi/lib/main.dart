import 'package:consumirapi/services/notes_services.dart';
import 'package:consumirapi/views/note_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void setupLocator(){
  GetIt.I.registerLazySingleton(()=> NotesService());
}


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}

