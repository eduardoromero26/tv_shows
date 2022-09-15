import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tv_shows/custom-widgets/selected_show_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic ShowsObject = {};

  Future fetchTvShowsDataFromApi() async {
    try {
      var resp =
          await http.get(Uri.parse('https://api.tvmaze.com/shows'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      });
      var data = jsonDecode(resp.body);
      return data;
    } catch (e) {}
  }

  Future getTvShowsDataFromFetch() async {
    var resp = await fetchTvShowsDataFromApi();
    setState(() {
      ShowsObject = resp;
    });
    print(ShowsObject);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTvShowsDataFromFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      //TODO LISTVIEW
      body: Container(
        child: ListView.builder(
            itemCount: ShowsObject.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedShowWidget(
                                    ShowsObj: ShowsObject[index],
                                  )),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        height: 160,
                        width: 160,
                        child: Image.network(
                            ShowsObject[index]['image']['medium']),
                      ),
                    ),
                    Center(child: Text(ShowsObject[index]['name'])),
                  ],
                )),
      ),
    );
  }
}
