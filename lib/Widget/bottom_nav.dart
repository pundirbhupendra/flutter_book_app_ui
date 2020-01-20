import 'package:flutter/material.dart';
class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var _curIndex = 0;
  var contents = 'Home';
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20, color: Colors.blue),
              title: Text("Home",
                  style: TextStyle(
                      fontSize: 14,
                      color: _curIndex == 0 ? Colors.red : Colors.black)),
              activeIcon: Icon(Icons.home, size: 20, color: Colors.blue)),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, size: 20, color: Colors.blue),
              title: Text("Bookmark",
                  style: TextStyle(
                      fontSize: 14,
                      color: _curIndex == 1 ? Colors.red : Colors.black)),
              activeIcon: Icon(Icons.bookmark, size: 20, color: Colors.red)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, size: 20, color: Colors.blue),
              title: Text("Book",
                  style: TextStyle(
                      fontSize: 14,
                      color: _curIndex == 2 ? Colors.red : Colors.black)),
              activeIcon: Icon(Icons.book, size: 20, color: Colors.red)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 20, color: Colors.blue),
              title: Text("Setting",
                  style: TextStyle(
                      fontSize: 14,
                      color: _curIndex == 2 ? Colors.red : Colors.black)),
              activeIcon: Icon(Icons.settings, size: 20, color: Colors.red))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
            switch (_curIndex) {
              case 0:
                contents = "Home";
                break;
              case 1:
                contents = "Bookmark";
                break;
              case 2:
                contents = "Book";
                break;
              case 2:
                contents = "Setting";
                break;
            }
          });
        });;
  }
}
