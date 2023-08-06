import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Style.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => ToDoPageView();
}

class ToDoPageView extends State<ToDoPage> {
  final textField = TextEditingController();
  List toDoList = [];
  String temp = "";

  myInputOnChange(content) {
    temp = content;
    content = "";
  }

  addItemToList() {
    if (temp.isNotEmpty) {
      setState(() {
        toDoList.add({"Item": temp});
      });
      temp = "";
    }
  }

  deleteItemFromView(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Center(
            child: Text(
          "To Do List",
          style: GoogleFonts.aldrich(textStyle: const TextStyle(fontSize: 25)),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //First Part
            Expanded(
                flex: 15,
                child: Row(
                  children: [
                    //==============1
                    Expanded(
                        flex: 77,
                        child: TextField(
                          controller: textField,
                          style: GoogleFonts.robotoSlab(
                              textStyle: const TextStyle(fontSize: 22)),
                          onChanged: (content) {
                            myInputOnChange(content);
                          },
                          decoration: appInputDecoration(),
                        )),

                    const SizedBox(
                      width: 3,
                    ),

                    //==============2
                    Expanded(
                        flex: 20,
                        child: ElevatedButton(
                          style: appButtonStyle(),
                          onPressed: () {
                            addItemToList();
                            textField.clear();
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(fontSize: 22),
                          ),
                        )),
                  ],
                )),

            //Second Part
            Expanded(
                flex: 85,
                child: ListView.builder(
                    itemCount: toDoList.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        color: Colors.brown[100],
                        elevation: 10,
                        shadowColor: Colors.blueGrey,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Text(
                                    toDoList[index]["Item"].toString(),
                                    style: GoogleFonts.robotoSlab(
                                        textStyle:
                                            const TextStyle(fontSize: 22)),
                                  ),
                                )),
                            Expanded(
                                flex: 20,
                                child: ElevatedButton(
                                    style: appButtonStyle(),
                                    onPressed: () {
                                      deleteItemFromView(index);
                                    },
                                    child: const Icon(Icons.delete)))
                          ],
                        ),
                      );
                    }))),
          ],
        ),
      ),
    );
  }
}
