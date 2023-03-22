import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenciler'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        width: 4.0,
                        color: _items[index]["sex"] == "e"
                            ? Colors.blue
                            : Colors.pink),
                  ),
                ),
                child: ListTile(
                  title: Text(_items[index]["name"]),
                  leading: Image.asset("images/${_items[index]["image"]}.jpg"),
                  subtitle: Text(_items[index]["number"]),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => ImageDialog(
                          img: _items[index]["image"],
                        ),
                      );
                    },
                    icon: const Icon(Icons.zoom_in),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageDialog extends StatelessWidget {
  ImageDialog({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("images/$img.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
