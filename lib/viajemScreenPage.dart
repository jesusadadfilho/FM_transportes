import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViagemsScreenPage extends StatefulWidget {
  @override
  _ViagemsScreenPageState createState() => _ViagemsScreenPageState();
}

class _ViagemsScreenPageState extends State<ViagemsScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViagensListPage(),
    );
  }
}

class ViagensListPage extends StatefulWidget {
  @override
  _ViagensListState createState() => _ViagensListState();
}

class _ViagensListState extends State<ViagensListPage> {

  Future getEntregas() async{

    var firebase = Firestore.instance;

    var querySnapshot = await firebase.collection("PlanoDeEntrega").document("BzdIiy2PPYvTXVuUVjRH").collection("Entrega").getDocuments();

    return querySnapshot.documents;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(future: getEntregas(),builder: (_, snapshot){

        
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Carregando entregas!!"),
          );
        }else{
          return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (_, index){
              return Card(
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(width: 1.0, color: Colors.white24))),
                        child: Icon(Icons.directions_bus, color: Colors.white),
                      ),
                      title: Text(
                        "Motorista: " + snapshot.data[index].data["caminhoneiro"],
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("Cliente: " + snapshot.data[index].data["cliente"], style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0))
                ),
              );
          });
        }
      }),
    );
  }
}



class DetalhesViagensPage extends StatefulWidget {
  @override
  _DetalhesViagensPageState createState() => _DetalhesViagensPageState();
}

class _DetalhesViagensPageState extends State<DetalhesViagensPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
