import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/flags.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                child: Center(
                  child: Text(_items[index]["name"]),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: SizedBox(
                      height: 300,
                      width: 400,
                      child: Image.asset(
                        _items[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
