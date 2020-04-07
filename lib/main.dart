import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/pages/add_event_page.dart';
import 'package:todolist/pages/add_task_page.dart';
import 'package:todolist/pages/task_page.dart';
import 'constant.dart';
import 'pages/event_page.dart';
import 'widgets/custom_button.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'translations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: customRedColor, fontFamily: "ComicNeue"),
      // Traduction
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('fr', ''),
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  double currentPage = 0;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 35.0,
            color: customRedColor,
          ),
          Positioned(
            right: -18,
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 200,
                color: Color(0xFFF1F1F1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 110,
            child: Text(
              DateFormat.MMMM(Translations.of(context).currentLanguage == 'en'
                      ? "en_EN"
                      : "fr_FR")
                  .format(date),
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFFA1A1A1),
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: currentPage == 0 ? AddTaskPage() : AddEventPage(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: customRedColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings, color: Color(0xFFA1A1A1)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Color(0xFFA1A1A1)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut);
            },
            buttonText: Translations.of(context).text('Tasks'),
            color: currentPage < 0.5 ? customRedColor : Colors.white,
            textColor: currentPage < 0.5 ? Colors.white : customRedColor,
            borderColor:
                currentPage < 0.5 ? Colors.transparent : customRedColor,
          ),
        ),
        SizedBox(
          width: 32.0,
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut);
            },
            buttonText: Translations.of(context).text('Events'),
            color: currentPage > 0.5 ? customRedColor : Colors.white,
            textColor: currentPage > 0.5 ? Colors.white : customRedColor,
            borderColor:
                currentPage > 0.5 ? Colors.transparent : customRedColor,
          ),
        ),
      ],
    );
  }

  Widget _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            new DateFormat.EEEE(Translations.of(context).currentLanguage == 'en'
                    ? "en_EN"
                    : "fr_FR")
                .format(date)
                .toString(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        //Expanded(child: TaskPage())
        //Expanded(child: EventPage())
        Expanded(
          child: PageView(
            controller: _pageController,
            children: <Widget>[TaskPage(), EventPage()],
          ),
        ),
      ],
    );
  }
}
