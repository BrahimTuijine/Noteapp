import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [
    {
      "note": "just klem w barra",
      "image": "facebook.png",
    },
    {
      "note": "just klem w barra",
      "image": "facebook.png",
    },
    {
      "note": "just klem w barra",
      "image": "facebook.png",
    },
    {
      "note": "just klem w barra",
      "image": "facebook.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("addnotes");
        },
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.INFO,
                  animType: AnimType.BOTTOMSLIDE,
                  
                  desc: 'Are you sure to LogOut',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                )..show();
              },
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: Key("$index"),
              child: ListNotes(notes: notes[index]),
            );
          },
        ),
      ),
    );
  }
}

class ListNotes extends StatelessWidget {
  final notes;
  ListNotes({this.notes});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              "images/note.jpg",
              fit: BoxFit.cover,
              height: 80,
              width: 90,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text("Title"),
              subtitle: Text("${notes['note']}"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
