import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodolistapp/models/task.dart';

class Task_page extends StatefulWidget {
  Task? tache = Task(
      id: 0, title: "", description: "", statut: false, date: DateTime.now());
  Task_page({super.key, this.tache});

  @override
  State<Task_page> createState() => _Task_pageState();
}

class _Task_pageState extends State<Task_page> {
  bool status = false;
  TextEditingController T_titre = TextEditingController();
  TextEditingController T_description = TextEditingController();
  TextEditingController T_time = TextEditingController();
  TextEditingController T_date = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.tache != null) {
      T_description.text = widget.tache!.description;
      T_titre.text = widget.tache!.title;
      T_time.text = DateFormat("HH:mm").format(widget.tache!.date);
      T_date.text = DateFormat("dd-MM-yyyy").format(widget.tache!.date);
      status = widget.tache!.statut;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creer une Tâche'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                // TaskWidget(tache: tache),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Statut'),
                      Switch(
                          value: status,
                          onChanged: (value) {
                            setState(() {
                              status = value;
                            });
                          })
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: T_titre,
                    decoration: InputDecoration(
                        labelText: "Titre",
                        hintText: "Donner un nom à votre tâche",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    maxLines: 8,
                    controller: T_description,
                    maxLength: 255,
                    decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Décrivez votre tâche",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: T_date,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      var d = await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1990),
                                              lastDate: DateTime(2060)) ??
                                          DateTime.now();
                                      T_date.text =
                                          DateFormat('dd-MM-yyyy').format(d);
                                      widget.tache!.date = DateTime(
                                          d.year,
                                          d.month,
                                          d.day,
                                          widget.tache!.date.hour,
                                          widget.tache!.date.minute,
                                          widget.tache!.date.second);
                                    },
                                    icon: Icon(Icons.date_range)),
                                labelText: "Date",
                                hintText: "Entrer une Date",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: T_time,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        var t = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                        if (t != null) {
                                          setState(() {
                                            T_time.text = t.format(context);
                                            widget.tache!.date = DateTime(
                                                widget.tache!.date.year,
                                                widget.tache!.date.month,
                                                widget.tache!.date.day,
                                                t.hour,
                                                t.minute);
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.timer)),
                                  labelText: "Heure",
                                  hintText: "Entrer une Heure",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.red)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Annuler",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "OK",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
