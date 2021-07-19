import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/listModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listModel;
  bool circular = true;
  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData() async {
    var res = await http.get(Uri.parse('https://www.metaweather.com/api/location/2295420/'));
    var r = json.decode(res.body);
    setState(() {
      listModel = ListModel.fromJson(r);
      print(listModel);
      circular = false;
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BENGALURU WEATHER'),
        ),
        body: Center(
          child: circular ? CircularProgressIndicator(): ListView.builder(itemCount: listModel.consolidatedWeather.length,itemBuilder: (BuildContext context, int index)=>
          dataShow(listModel.consolidatedWeather[index],index)),
        )
      ),
    );
  }
  Widget dataShow(Model obj, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ]
        ),
        height: 100,
        // width: MediaQuery.of(context).size.width,
        child: Card(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
              child: Image(image: NetworkImage('https://www.metaweather.com/static/img/weather/png/${obj.weatherStateAbbr}.png')),),
              Padding(padding: EdgeInsets.only(left: 25),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " ${DateFormat('EEEE').format(obj.applicableDate)} : ${obj.weatherStateName}",
                    style: TextStyle(fontSize: 18, color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Temperature : ${obj.theTemp}",
                    style: TextStyle(fontSize: 18, color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                ],
              ),)

            ],
          )
        ),
      ),
    );
  }
}
  


