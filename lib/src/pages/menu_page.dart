import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/src/models/providers/navegacion_provider.dart';
import 'package:instagram/src/pages/home_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: _Paginas(),
    //   bottomNavigationBar: _Navegacion(),
    // );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _Paginas(),
          Positioned(bottom: 0, child: _Navigation())
        ],
      ),
      floatingActionButton: _FloatingLogo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _FloatingLogo extends StatelessWidget {
  const _FloatingLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          elevation: 5.0,
          onPressed: () {},
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logo_insta.png'),
                    fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.home, color: Color(0xffDD2A7B)),
            onPressed: null,
          ),
          IconButton(icon: FaIcon(FontAwesomeIcons.search), onPressed: null),
          Container(
            width: 60,
            height: 60,
          ),
          IconButton(icon: FaIcon(FontAwesomeIcons.heart), onPressed: null),
          Container(
            margin: EdgeInsets.only(right: 18),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/friends/mau.jpg'))),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            title: Text('')),
        // BottomNavigationBarItem(icon: Icon(Icons.favorite)),
      ],
      currentIndex: navegacionModel.paginaActual,
      selectedItemColor: Colors.red,
      onTap: (i) => navegacionModel.paginaActual = i,
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.yellow,
        ),
        // Container(
        //   color: Colors.green,
        // )
      ],
    );
  }
}
