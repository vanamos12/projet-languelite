import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatelessWidget{

  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  void connexion() async {
    var name = nameController.text;
    var password = passwordController.text;

    var url = Uri.parse('http://localhost:8000/api/authenticate');
    var response = await http.post(url, body: {'name': name, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  static const String id = 'login';
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child:Column(
                children: <Widget>[

                  SizedBox(height: 40,),

                  Text(
                    'Se connecter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child : Column(
                        children: <Widget>[
                          TextField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(fontSize: 15),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0
                              ),
                            ),
                            style: TextStyle(fontSize:14),
                          ),
                          SizedBox(height: 10,),

                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 15),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0
                              ),
                            ),
                            style: TextStyle(fontSize:14),
                          ),

                          SizedBox(height: 40,),
                        
                          RaisedButton(
        
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: (){
                              connexion();
                            },
                            child: Text(
                                "Connexion",
                                style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold')
                            )
                        )
                          
                        ]
                    ),
                  ),

                  
                ]
            ),
          ),
        ),


      );

  }
}
