import 'package:flutter/material.dart';

class SelectedShowWidget extends StatefulWidget {
  final ShowsObj;

  SelectedShowWidget({Key? key, required this.ShowsObj}) : super(key: key);
  @override
  State<SelectedShowWidget> createState() => _SelectedShowWidgetState();
}

class _SelectedShowWidgetState extends State<SelectedShowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.ShowsObj['name'],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            height: 160,
            width: 160,
            child: Image.network(widget.ShowsObj['image']['medium']),
          ),
          SizedBox(
            height: 12,
          ),
          Text(widget.ShowsObj['language']),
          SizedBox(
            height: 8,
          ),
          Text(widget.ShowsObj['status']),
          SizedBox(
            height: 8,
          ),
          Text(widget.ShowsObj['genres'].join(', ')),
        ],
      )),
    );
  }
}
