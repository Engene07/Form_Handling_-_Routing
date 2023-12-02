import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main(){
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("First Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Please enter your name: "
              ),
              keyboardType: TextInputType.name
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(name: _nameController.text)
                )
              );
            },
            child: Text("Proceed to Second Page"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // This is the color of the button
              ) 
          )
        ]
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  final String? name;
  SecondPage({this.name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("2nd Page")
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Welcome $name",
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go back to First page",
            style: TextStyle(
            color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // This is the color of the button
              )
          )
        ],
      ),
    );
  }
}