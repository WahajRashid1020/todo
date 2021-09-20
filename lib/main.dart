// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/add.dart';
import 'package:todo/completedlist.dart';
import 'package:todo/provider/todosprovider.dart';
import 'package:todo/todolist.widget.dart';
// import 'package:todo/todowidget.dart';
// import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.grey,
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoList(),
      CompletedList(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
          style: TextStyle(color: Colors.teal, fontSize: 50),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.teal,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined, size: 28), label: "Todos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: "Completed")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddToDO(),
            barrierDismissible: false,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
