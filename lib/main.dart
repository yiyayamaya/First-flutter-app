import 'package:flutter/material.dart';
import 'global_config.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      title: '文字冒险',
      home: new Home(),
    );
*/
    return new MaterialApp(
      title: 'Flutter Demos',
      routes: {
        '/': (BuildContext context) => new Home(),
        '/login': (BuildContext context) => new PictureWidget()
      },
    );

/*
    return new MaterialApp(
      title: 'Navigation',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new ArticleListScreen(),
      },
    );*/
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text('今天的背完了'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('再来25'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new PictureWidget()),
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

    return Column(
      children: [
        new Container(
            padding: const EdgeInsets.fromLTRB(50, 70, 50, 20),
            child: new Image.asset('images/lake.jpg')),
        new Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: new RaisedButton(
            child: new Text(choiceA),
            onPressed: () {
              makechoice('A', correctchoice);
            },
          ),
        ),
        new Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: new RaisedButton(
            child: new Text(choiceB),
            onPressed: () {
              makechoice('B', correctchoice);
            },
          ),
        ),
        new Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: new RaisedButton(
            child: new Text(choiceC),
            onPressed: () {
              makechoice('C', correctchoice);
            },
          ),
        ),
        new Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: new RaisedButton(
            child: new Text(choiceD),
            onPressed: () {
              makechoice('D', correctchoice);
            },
          ),
        ),
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
              title: new Text(indexofques.toString() + '选错了'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class PictureWidget extends StatefulWidget {
  @override
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
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

    return Column(
      children: [
        new Container(
            padding: const EdgeInsets.fromLTRB(50, 70, 50, 150),
            child: new Text("Abandon",
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 40.0,
                ))),
        new Center(
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                new GestureDetector(
                    onTap: (){
                     print("1");
                      },
                child:new Image.asset(
                  'images/lake.jpg',
                  width: 190.0,
                  height: 144.4,
                ),),

            new GestureDetector(
                    onTap: (){
                     print("2");
                      },
                child:new Image.asset(
                  'images/lake.jpg',
                  width: 190.0,
                  height: 144.4,
                ),),


              ]),
        ),
        new Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: new Center(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                 new GestureDetector(
                    onTap: (){
                     print("3");
                      },
                child:new Image.asset(
                  'images/lake.jpg',
                  width: 190.0,
                  height: 144.4,
                ),),

                  new GestureDetector(
                    onTap: (){
                     print("4");
                      },
                child:new Image.asset(
                  'images/lake.jpg',
                  width: 190.0,
                  height: 144.4,
                ),),
                ]),
          ),
        )
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
              title: new Text(indexofques.toString() + '选错了'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class Article {
  String title;
  String content;

  Article({this.title, this.content});
}

class ArticleListScreen extends StatelessWidget {
  final List<Article> articles = new List.generate(
    10,
    (i) => new Article(
          title: 'Article $i',
          content: 'Article $i: The quick brown fox jumps over the lazy dog.',
        ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Article List'),
      ),
      body: new ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(articles[index].title),
            onTap: () async {
              String result = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ContentScreen(articles[index]),
                ),
              );

              if (result != null) {
                Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text("$result"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  final Article article;

  ContentScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${article.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Text('${article.content}'),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Like');
                  },
                  child: new Text('Like'),
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Unlike');
                  },
                  child: new Text('Unlike'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new HomeNavigator(),
    new ProfileNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(text),
    );
  }
}

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home':
            builder = (BuildContext context) => new HomePage();
            break;
          case 'demo1':
            builder = (BuildContext context) => new ArticleListScreen();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }

        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class ProfileNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Navigator(
      initialRoute: 'profile',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'profile':
            builder = (BuildContext context) => new Profile();
            break;
          case 'login':
            builder = (BuildContext context) => new PictureWidget();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }

        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('demo1'),
          onPressed: () {
            Navigator.of(context).pushNamed('demo1');
          },
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Profile'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('开始背单词'),
          onPressed: () {
            Navigator.of(context).pushNamed('login');
          },
        ),
      ),
    );
  }
}
