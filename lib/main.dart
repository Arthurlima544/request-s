import 'package:flutter/material.dart';
import 'package:learn_more_about_request/view/controller/list_todos_controller.dart';

import 'services/json_placeholder/models/todos_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListTodosController controller = ListTodosController();

  @override
  void initState() {
    controller.list.addListener(() {
      setState(() {});
    });
    controller.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Todos"),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.list,
        builder: (context, List<Todos> value, child) {
          return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${value[index].id}",
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          value[index].title,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Expanded(
                        child: value[index].completed
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
