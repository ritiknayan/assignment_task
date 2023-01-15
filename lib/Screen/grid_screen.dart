import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  static const nameRoute = '/GridScreen';
  GridScreen(
      {super.key, required this.alphabates, required this.m, required this.n});

  int m;
  int n;
  String alphabates;

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> alphabatesList = [];

    for (int i = 0; i < (widget.m * widget.n); i++) {
      alphabatesList.add(widget.alphabates[i]);
      print(widget.alphabates);
    }

    return Scaffold(
        appBar: AppBar(title: const Text('title')),
        body: GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  (MediaQuery.of(context).size.width) * (1 / widget.m),
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisExtent: 10),
          children: alphabatesList.map((e) {
            return SizedBox(
              height: MediaQuery.of(context).size.width * (1 / widget.m),
              child: Center(
                child: Text(
                  e,
                  style: const TextStyle(fontFamily: 'OpenSans', fontSize: 10),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
