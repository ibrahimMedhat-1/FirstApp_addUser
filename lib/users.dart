import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:users/main.dart';
import 'todos.dart';

void main() {
  return (runApp(const MaterialApp(
    home: Users(),
  )));
}

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<todos> todo = [];
  bool v = false;

  getData() async {
    Response res =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List data = jsonDecode(res.body);
    for (int i = 0; i < data.length; i++) {
      Map<String, dynamic> userMap = data[i];
      todos t = todos.fromMap(userMap);
      if (t.userId == id) {
        todo.add(t);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User $id',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey,
          child: SingleChildScrollView(
              child: Column(
                  children: todo
                      .map((e) => Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          width: 400,
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'User: ${e.userId.toString()}',
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 30),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'ID: ${e.id.toString()}',
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 30),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tittle: ${e.title.toString()}',
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 25),
                                ),
                              ),
                              Checkbox(
                                  activeColor: Colors.green,
                                  value: e.completed,
                                  onChanged: (func) {
                                    setState(() {});
                                  }),
                            ],
                          )))
                      .toList())),
        ));
  }
}
