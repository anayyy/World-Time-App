import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    String clipArt = data['isDayTime'] ? 'assets/day.jpg' : 'assets/night.png';

    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              Text(data['location'], style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                color: Colors.grey[700],
              )),

              Text(data['time'], style: TextStyle(
                fontSize: 69.0,
              )),

              Text(data['date'], style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.0,
                color: Colors.grey[700],
              )),

              SizedBox(height: 40),

              Image(image: AssetImage(clipArt), height: 300.0, width: 300.0,),

              SizedBox(height: 40),

              TextButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data= result;
                });
              },
              icon: Icon(Icons.edit_location_alt, color: Colors.white,),
              label: Text('Edit Location', style: TextStyle(
                color: Colors.white,
              ),),
              style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.black,
                  ),
              ),


        ]),
      ),
    );
  }
}
