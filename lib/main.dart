import 'package:flutter/material.dart';
import 'global_config.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '文字冒险',
      home: new FavoriteWidget(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        
        automaticallyImplyLeading:false,
        title: new Text('今天的背完了'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('再来25'),
          onPressed: () {
            
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new FavoriteWidget()),
            );
          },
        ),
      ),
    );
  }
}

// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  var questionlist = ["第一个问题", "第二个问题", "第三个问题"];

  int indexofques = 0;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();
  static List<List<String>> listofanswer = [
    ['1A', '1B', '1C', '1D'],
    ['2A', '2B', '2C', '2D'],
    ['3A', '3B', '3C', '3D'],
    ['4A', '4B', '4C', '4D']
  ];

  var listofright = ['A', 'A', 'A', 'A'];
  

  var thetext = '';

  int indexofword = 0;

 

  void makechoice(var mychoice, var mycorrectchoice) {
    print("请看这里" + mychoice + " " + mycorrectchoice);

    setState(() {
      if (mychoice == mycorrectchoice) {
        print("选对啦");

        if (indexofques >= 3) {
          Navigator.pop(context);
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new SecondScreen()),
          );
        } else {
          indexofques++;
        }
      } else {
        print("没选对");
        _pushSaved(indexofques);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var correctchoice = listofright[indexofques];
    var choiceA = (listofanswer[indexofques])[0];
    var choiceB = (listofanswer[indexofques])[1];
    var choiceC = (listofanswer[indexofques])[2];
    var choiceD = (listofanswer[indexofques])[3];

    return Row(
      children: [
        /*
        new IconButton(
          icon: new Icon(Icons.star),
          color: Colors.red[500],
          onPressed: pressstar,
        ),
        new IconButton(
          icon: new Icon(Icons.ac_unit),
          color: Colors.blue[500],
          onPressed: presssnow,1
        ),*/

        new RaisedButton(
          child: new Text(choiceA),
          onPressed: () {
            makechoice('A', correctchoice);
          },
        ),
        new RaisedButton(
          child: new Text(choiceB),
          onPressed: () {
            makechoice('B', correctchoice);
          },
        ),
        new RaisedButton(
          child: new Text(choiceC),
          onPressed: () {
            makechoice('C', correctchoice);
          },
        ),
        new RaisedButton(
          child: new Text(choiceD),
          onPressed: () {
            makechoice('D', correctchoice);
          },
        ),

        /*
         new Text(
              '学习Text',
              textAlign: TextAlign.center, //文本对齐方式  居中
              textDirection: TextDirection.ltr, //文本方向
              softWrap: false, //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
              overflow: TextOverflow
                  .ellipsis, //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
              textScaleFactor: 2.0, //字体显示的赔率
              maxLines: 10, //最大行数
              style: new TextStyle(
                decorationColor: const Color(0xffffffff), //线的颜色
                decoration: TextDecoration
                    .none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                decorationStyle: TextDecorationStyle
                    .solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
                fontStyle: FontStyle.italic, //文字样式，斜体和正常
                fontSize: 2.0, //字体大小
                fontWeight: FontWeight.w900, //字体粗细  粗体和正常
                color: const Color(0xffffffff), //文字颜色
              ),
            ),
            */
      ],
    );
  }

  void _pushSaved(int indexofques) {
    print("我在里面");
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text(indexofques.toString()+'选错了'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
