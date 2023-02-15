import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  List<String> tasks = ['Homework', 'Work', 'Eat a sandwich'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
          children: <Widget> [
            TextFormField(
              controller: myController
            ),
            TextButton(
                onPressed: () => setState(() => tasks.add(myController.text)),
                child: Text('Add Task')),
            Expanded(child: ListViewBuilder(list: tasks)),
          ]
      )
    );
  }
}

class ListViewBuilder extends StatefulWidget {

  ListViewBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {

  @override
  Widget build(BuildContext context) {
    developer.log('hallo2');
    return ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            return BigCard(
                task: widget.list.elementAt(index)
            );
          });
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.task
  });

  final String task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget> [
            Text(task),
          ]
        )
      ),
    );
  }
}

