import 'package:flutter/material.dart';
import 'package:movies_repository/MovieBrief.dart';
import 'package:movies_repository/MovieScreen.dart';
import 'package:movies_repository/NetworkClient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          accentColor: Colors.lightGreen,
          primaryColor: Colors.amberAccent),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Object> movies = new List<Object>();
  int page = 1;
  bool isLoading;
  bool canLoadMore;

  void _loadTopRatedMoviesPage() {
    new NetworkClient().getTopRatedMovies(page, (topRatedMoviesListResult) {
      setState(() {
        if (movies.length != 0) {
          movies.removeLast();
        }
        isLoading = false;
        page = page + 1;
        movies.addAll(topRatedMoviesListResult.results);
      });
    }, (error) {
      print("error = $error");
    });
  }

  void _incrementCounter() {
    print("_incrementCounter method called");
  }

  @override
  void initState() {
    super.initState();
    _loadTopRatedMoviesPage();
  }

  @override
  Widget build(BuildContext context) {
    var listView = createListView();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: listView,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.accessible_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  NotificationListener createListView() {
    var childrenDelegate = new MySliverChildBuilderDelegate((context, pos) {
      Object obj = movies[pos];
      if (obj is MovieBrief) {
        MovieBrief movie = obj;

        return new Card(
            key: Key("$pos"),
            color: Colors.black38,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieScreen(movie)),
                  );
                },
                child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          movie.overview,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ))));
      } else if (obj is Loading) {
        return Container(
          child: CircularProgressIndicator(value: null),
          width: 100,
          height: 100,
          padding: EdgeInsets.all(20),
        );
      } else {
        Text("WHAT IS THIS?!");
      }
    }, childCount: movies.length);

    var listView = new ListView.custom(childrenDelegate: childrenDelegate);

    bool scrollNotification(ScrollUpdateNotification notification) {
      print("notification = $notification");
      if (!isLoading &&
          notification.scrollDelta > 0 &&
          childrenDelegate.canLoadMore) {
        setState(() {
          isLoading = true;
          movies.add(Loading());
        });
        _loadTopRatedMoviesPage();
        return true;
      }
      return false;
    }

    return new NotificationListener<ScrollUpdateNotification>(
        child: listView, onNotification: scrollNotification);
  }
}

class MySliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  MySliverChildBuilderDelegate(IndexedWidgetBuilder builder, {int childCount})
      : super(builder, childCount: childCount);

  bool canLoadMore;

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    canLoadMore = lastIndex >= childCount - 1;
    print("lastIndex = $lastIndex");
  }
}

class Loading {}
