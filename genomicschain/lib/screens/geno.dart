import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:genomicschain/screens/blockchain.dart';
import 'package:genomicschain/screens/home.dart';
import 'package:genomicschain/screens/mygene.dart';
import 'package:genomicschain/screens/report.dart';
import 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true));

void main() {
  runApp(const GenoHomeApp());
}

class GenoHomeApp extends StatelessWidget {
  const GenoHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainHomePage(),
    );
  }
}

class GenoHomePage extends StatefulWidget {
  const GenoHomePage({super.key});

  @override
  State<GenoHomePage> createState() => _GenoeHomePageState();
}

class _GenoeHomePageState extends State<GenoHomePage> {
  var _pageIndex = 0; // 페이지 정보

  static final List<Widget> _widgetOptions = <Widget>[
    const MainHomePage(),
    const MyGeneScreen(),
    const MyReportPage(),
    const BlockchainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF536DFE),
        leading: IconButton(
          icon: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/img/icon.png',
                width: 50.0, // Set the width of the circle
                height: 50.0, // Set the height of the circle
                fit: BoxFit.cover, // Ensure the image covers the circle
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              _pageIndex = 0;
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu_outlined),
            onPressed: () {
              logger.i('Menu button clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              logger.i('Search button clicked');
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_dna),
            label: 'My Gene',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_bar_chart_square),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_chat),
            label: 'News',
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: const Color(0xFF536DFE),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
