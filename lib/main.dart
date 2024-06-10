import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/task.dart';
import 'widgets/task_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Task tache = Task(
      id: 1,
      title: 'Homework',
      description: 'devoir de maison ',
      statut: true,
      date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const [
                // TaskWidget(tache: tache),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    //  controller: ,
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
                    // controller: ,
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
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Date",
                          hintText: "Entrer une Date",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          )),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
