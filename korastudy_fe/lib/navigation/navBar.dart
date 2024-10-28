import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const NavBar(
      {Key? key, required this.currentIndex, required this.onTabSelected})
      : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 50, // Chiều cao của BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nút 1
                MaterialButton(
                  minWidth: 30,
                  height: 30,
                  onPressed: () => widget.onTabSelected(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                          size: 20,
                          color: widget.currentIndex == 0
                              ? Colors.blue
                              : Colors.grey),
                      Text('Trang chủ',
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.currentIndex == 0
                                  ? Colors.blue
                                  : Colors.grey)),
                    ],
                  ),
                ),
                // Nút 2
                MaterialButton(
                  minWidth: 30,
                  height: 30,
                  onPressed: () => widget.onTabSelected(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder,
                          size: 20,
                          color: widget.currentIndex == 1
                              ? Colors.blue
                              : Colors.grey),
                      Text('Thi',
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.currentIndex == 1
                                  ? Colors.blue
                                  : Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            // Right NavBar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nút 3
                MaterialButton(
                  minWidth: 30,
                  height: 30,
                  onPressed: () => widget.onTabSelected(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.forum,
                          size: 20,
                          color: widget.currentIndex == 2
                              ? Colors.blue
                              : Colors.grey),
                      Text('Forums',
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.currentIndex == 2
                                  ? Colors.blue
                                  : Colors.grey)),
                    ],
                  ),
                ),
                // Nút 4
                MaterialButton(
                  minWidth: 30,
                  height: 30,
                  onPressed: () => widget.onTabSelected(3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle,
                          size: 20,
                          color: widget.currentIndex == 3
                              ? Colors.blue
                              : Colors.grey),
                      Text('Cá nhân',
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.currentIndex == 3
                                  ? Colors.blue
                                  : Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
