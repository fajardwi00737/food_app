import 'package:flutter/material.dart';
import 'package:flutter_tes_live_code/home_page.dart';
import 'package:flutter_tes_live_code/screen/account_page.dart';
import 'package:flutter_tes_live_code/screen/orders_page.dart';

class HomeNavigation extends StatefulWidget {
  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  Future _getDataFuture;
  List<Widget> _widgetOptions = <Widget>[];
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _getDataFuture = _setChildren();
    super.initState();
  }

  void _onItemTapped(int index) {
        setState(() {
          _selectedIndex = index;
        });
  }

  _getData() async {
    await _setChildren();
  }

  _setChildren() async {
    _widgetOptions.add(HomePage());
    _widgetOptions.add(OrdersPage());
    _widgetOptions.add(AccountPage());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            print('AYAAMMMMMM KAMPUSSSSSSSSSSS');
            //_progressDialog.dismiss();
            return Container(color: Colors.red);
          } else if (snapshot.connectionState == ConnectionState.done) {
            //_progressDialog.dismiss();
            print('AYAAMMMMMM GOREEEENGGGGGGGGGGG');
            return _buildMain();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print('AYAAMMMMMM POOOOOOOOOOOOOOOPPPPPP');
            //_progressDialog.show();
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return _buildMain();
        });
  }

  _buildMain() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Beranda',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              title: Text(
                'Riwayat',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Akun',
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xFF919EAB),
          selectedItemColor: Colors.green[300],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
