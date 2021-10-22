//@dart=2.9

import 'dart:async';
import 'package:devolopment/01_note_files/note_details.dart';
import 'package:devolopment/01_note_files/search_note.dart';
import 'package:devolopment/db_helper/db_helper.dart';
import 'package:devolopment/model_class/notes.dart';
import 'package:devolopment/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  int axisCount = 2;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = [];
      updateListView();
    }
    Widget myAppBar() {
      return AppBar(
        title: Text('My Diary', style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: noteList.length == 0
            ? Container()
            : IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () async {
                  final Note result = await showSearch(
                      context: context, delegate: NotesSearch(notes: noteList));
                  if (result != null) {
                    navigateToDetail(result, 'Edit Note');
                  }
                },
              ),
      );
    }

    return Scaffold(
      appBar: myAppBar(),
      body: noteList.length == 0
          ? Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Click on the add button to add a new note!',
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: getNotesList(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 6,
        isExtended: true,
        label: Text(
          "Add Dairy",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          navigateToDetail(Note('', '', 3, 0), 'Add Note');
        },
        tooltip: 'Add Note',
        backgroundColor: Color(0xFFFFA738),
      ),
    );
  }
  //!note List custom

  Widget getNotesList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          navigateToDetail(this.noteList[index], 'Edit Note');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFE6197), Color(0xFFFFB463)]),
              color: colors[this.noteList[index].color],
              //  border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          this.noteList[index].title,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    Text(
                      getPriorityText(this.noteList[index].priority),
                      style: TextStyle(
                        color: getPriorityColor(this.noteList[index].priority),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            this.noteList[index].description == null
                                ? ''
                                : this.noteList[index].description,
                            style: Theme.of(context).textTheme.bodyText1),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(this.noteList[index].date,
                        style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.white;
        break;
      case 2:
        return Colors.white;
        break;
      case 3:
        return Colors.white;
        break;
      case 4:
        return Colors.white;
        break;
      case 5:
        return Colors.white;
        break;
      case 6:
        return Colors.white;
        break;

      default:
        return Colors.white;
    }
  }

  //? Returns the priority icon
  String getPriorityText(int priority) {
    switch (priority) {
      case 1:
        return 'Anger';
        break;
      case 2:
        return 'Surprice';
        break;
      case 3:
        return 'Fear';
        break;
      case 4:
        return 'Bored';
        break;

      case 5:
        return 'Sad';
        break;

      case 6:
        return 'Happy';
        break;

      default:
        return 'Happy';
    }
  }
  // void _delete(BuildContext context, Note note) async {
  //   int result = await databaseHelper.deleteNote(note.id);
  //   if (result != 0) {
  //     _showSnackBar(context, 'Note Deleted Successfully');
  //     updateListView();
  //   }
  // }

  // void _showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoteDetail(note, title)));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then(
      (database) {
        Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
        noteListFuture.then(
          (noteList) {
            setState(
              () {
                this.noteList = noteList;
                this.count = noteList.length;
              },
            );
          },
        );
      },
    );
  }
}
