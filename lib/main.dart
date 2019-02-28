import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  var outvalue=1;
  FavoriteWidget myf=new FavoriteWidget();

  
  @override
  Widget build(BuildContext context) {
    Widget firstw = Container(
      child: myf,
    );

    return MaterialApp(
      title: '文字冒险',
      home: Scaffold(
        appBar: AppBar(
          title: Text('这是一个文字冒险'),
          
        ),
        body: ListView(
          children: [


              IconButton(
          icon: (Icon(Icons.star)),
          color: Colors.red[500],
          onPressed: changevalue,
        ),

             new Text(
              outvalue.toString()),
            firstw,
          ],
        ),
      ),
    );
  }
  

void changevalue(){
print(myf.hashCode);

print(myf.createState().hashCode);
}
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column();
  }
}

// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}



class _FavoriteWidgetState extends State<FavoriteWidget> {

  
  var questionlist = ["第一个问题", "第二个问题", "第三个问题"];

  String thetext = '';

  int indexofques = 0;
  void pressstar() {
    setState(() {
      indexofques++;
      if (indexofques >= questionlist.length) {
        indexofques = indexofques - questionlist.length;
      }
      thetext = questionlist[indexofques];
     
    });
  }

  void presssnow() {
    setState(() {
      indexofques++;
      if (indexofques >= questionlist.length) {
        indexofques = indexofques - questionlist.length;
      }
      thetext = questionlist[indexofques];

    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: (Icon(Icons.star)),
          color: Colors.red[500],
          onPressed: pressstar,
        ),
        IconButton(
          icon: (Icon(Icons.ac_unit)),
          color: Colors.blue[500],
          onPressed: presssnow,
        ),
        Text(thetext),
      ],
    );
  }

}
