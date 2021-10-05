//@dart=2.9

import 'dart:io';

import 'package:devolopment/db_helper/db_helper.dart';
import 'package:devolopment/model_class/notes.dart';
import 'package:devolopment/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  int color;
  bool isEdited = false;
  NoteDetailState(this.note, this.appBarTitle);

  File image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    color = note.color;
    return WillPopScope(
        onWillPop: () async {
          isEdited ? showDiscardDialog(context) : moveToLastScreen();
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appBarTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
            //!
            backgroundColor: colors[color],
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  isEdited ? showDiscardDialog(context) : moveToLastScreen();
                }),
            //!
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.photo, color: Colors.red),
                  onPressed: () => pickImage()),
              IconButton(
                icon: Icon(Icons.delete_rounded, color: Colors.red),
                onPressed: () {
                  showDeleteDialog(context);
                },
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(
                  Icons.done_outline_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  titleController.text.length == 0
                      ? showEmptyTitleDialog(context)
                      : _save();
                },
              ),
            ],
          ),
          body: Container(
            color: colors[color],
            child: ListView(
              children: <Widget>[
                PriorityPicker(
                  selectedIndex: 6 - note.priority,
                  onTap: (index) {
                    isEdited = true;
                    note.priority = 6 - index;
                  },
                ),
                if (image != null)
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                image: FileImage(image), fit: BoxFit.cover),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    image = null;
                                  });
                                },
                                child: Icon(Icons.delete),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                // ColorPicker(
                //   selectedIndex: note.color,
                //   onTap: (index) {
                //     setState(() {
                //       color = index;
                //     });
                //     isEdited = true;
                //     note.color = index;
                //   },
                // ),
                //!          DATE
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date"),
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 6.0),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: dateController,
                                  onChanged: (value) {
                                    updateDate();
                                  },
                                  autofocus: false,
                                  cursorColor: Colors.orange.shade500,
                                  decoration: InputDecoration(
                                    hintText: DateFormat.yMMMd()
                                        .format(_selectedDate),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today_outlined,
                                    color: Colors.grey),
                                onPressed: () {
                                  _getDateFromUser();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //!          DATE

                //todo  title

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title"),
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 6.0),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  maxLines: null,
                                  maxLength: null,
                                  autofocus: false,
                                  cursorColor: Colors.orange.shade500,
                                  controller: titleController,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  onChanged: (value) {
                                    updateTitle();
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Give Title",
                                    //    hintStyle: subTitleStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Divider(
                //   color: Colors.black,
                // ),
                //todo  title

                //?     description

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dear Diary"),
                        Container(
                          height: 500,
                          margin: EdgeInsets.only(top: 6.0),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: null,
                                controller: descriptionController,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (value) {
                                  updateDescription();
                                },
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Write your diary',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //?     description
              ],
            ),
          ),
        ));
  }

  _getDateFromUser() async {
    DateTime _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2120),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("something is wrong");
    }
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Discard Changes?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Are you sure you want to discard changes?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("No",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  void showEmptyTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Title is empty!",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text('The title of the note cannot be empty.',
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("Okay",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Delete Note?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Are you sure you want to delete this note?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("No",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),
          ],
        );
      },
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateTitle() {
    isEdited = true;
    note.title = titleController.text;
  }

  void updateDescription() {
    isEdited = true;
    note.description = descriptionController.text;
  }

  void updateDate() {
    isEdited = true;
    note.date = dateController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    // note.date = DateFormat.yMMMd().format(DateTime.now());
    note.date = DateFormat.yMMMd().format(_selectedDate);

    if (note.id != null) {
      await helper.updateNote(note);
    } else {
      await helper.insertNote(note);
    }
  }

  void _delete() async {
    await helper.deleteNote(note.id);
    moveToLastScreen();
  }
}
