// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:kalavastha/geolocator/location.dart';
import 'package:one_clock/one_clock.dart';


TextEditingController citycontroller=TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var cityname="";

  @override
  Widget build(BuildContext context) {
    
    
    //  widget for container box
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 219, 224),
      body: Center(
        child: FutureBuilder(
          future: getweather(cityname),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            dynamic data = snapshot.data;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: snapshot.data==null?
                [CircularProgressIndicator()]:[
                  
                  ContainerBox(
                      height: 0.08,
                      width: 0.9,
                      hintname: "location",
                      fontsize: 15,
                      txt: "${data.cityname}"),

                      
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  time(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ContainerBox(
                      height: 0.3,
                      width: 0.5,
                      hintname: "Temperature",
                      fontsize: 45,
                      txt: "${data.temperture.ceil() - 273} °C",
                     
                    
                      ),
                      
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "Tem min",
                              fontsize: 15,
                              txt: "${data.tem_min.ceil() - 273}"),
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "Wind",
                              fontsize: 15,
                              txt: "${data.wind}"),
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "Tem max",
                              fontsize: 15,
                              txt: "${data.tem_max.ceil() - 273}"),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "Humidity",
                              fontsize: 15,
                              txt: "${data.humidity}"),
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "sea level",
                              fontsize: 15,
                              txt: "${data.sea_lvl}"),
                          ContainerBox(
                              height: 0.15,
                              width: 0.3,
                              hintname: "feel like",
                              fontsize: 15,
                              txt: "${data.feels_like.ceil() - 273}"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: const Color.fromARGB(255, 64, 210, 251),
        onPressed: () {
          showDialog(context: context, builder: (context)
          {
            return AlertDialog(
              title: Text("Search City", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),),
              actions: [
                
                TextField(
                  controller: citycontroller,
                  decoration: InputDecoration(
                      hintText: "city name",
                      icon: const Icon(Icons.location_on_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                TextButton(onPressed: (){
                  print(citycontroller.text);
                  setState(() {
                    cityname=citycontroller.text.trim();
                  });
                  Navigator.pop(context);
                }, child: Text("search"))
              ],
            );
          });
        },
      ),
    );
  }
}


//  hintname

class Hinttext extends StatelessWidget {

  final String hintname;
  const Hinttext({super.key, required this.hintname});

  @override
  Widget build(BuildContext context) {
    return Text(hintname);
  }
}

//  weather data

class Weatherdata extends StatelessWidget {
  final String weatherdata;

  const Weatherdata({super.key, required this.weatherdata});

  @override
  Widget build(BuildContext context) {
    return Text(weatherdata);
  }
}













// widget

class ContainerBox extends StatelessWidget {
  final double height;
  final double width;
  final String txt;
  final String hintname;
  final double fontsize;
  
  const ContainerBox(
      {super.key,
      required this.height,
      required this.width,
      required this.txt,
      required this.hintname,
      required this.fontsize,});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              hintname,
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing:2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              txt,
              style: TextStyle(fontSize: fontsize),
          
            ),
          ],
        ));
  }
}










//  time

Widget time() {
  var dateTimee;
  return DigitalClock(
    showSeconds: true,
    datetime: dateTimee,
    textScaleFactor: 0.7,
    isLive: true,
  );
}

