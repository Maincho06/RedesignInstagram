import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/src/models/EstadoModel.dart';
import 'package:instagram/src/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          children: <Widget>[
            _TitleHeader(),
            SizedBox(
              height: 5,
            ),
            _Estados(),
            SizedBox(
              height: 5,
            ),
            _Search(),
            SizedBox(
              height: 5,
            ),
            _Feed()
          ],
        ),
      ),
    );
  }
}

class _Feed extends StatelessWidget {
  const _Feed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
            physics: BouncingScrollPhysics(),
            children: List.generate(50, (index) => Post())),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Explorar',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              height: 45,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)),
            )
          ],
        ),
      ),
    );
  }
}

class _Estados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estados = <EstadoModel>[
      new EstadoModel('assets/friends/harold.jpg', 'bitone.98',
          Color(0xffFC0B7B), Color(0xff7820AD)),
      new EstadoModel('assets/friends/lorena.jpg', 'lorenab_1299',
          Color(0xffFC0B7B), Color(0xff7820AD)),
      new EstadoModel('assets/friends/genio.jpg', 'sebas.m', Color(0xffFC0B7B),
          Color(0xff7820AD)),
      new EstadoModel('assets/friends/andrea.jpg', 'glori.llerena',
          Color(0xffFC0B7B), Color(0xff7820AD)),
      new EstadoModel('assets/friends/ricardo.jpg', 'richi.boy',
          Color(0xffFC0B7B), Color(0xff7820AD)),
      new EstadoModel('assets/friends/wuinton.jpg', 'wuinton',
          Color(0xffFC0B7B), Color(0xff7820AD)),
      new EstadoModel('assets/friends/bryant.jpg', 'bryant.m',
          Color(0xffFC0B7B), Color(0xff7820AD)),
    ];

    List<_OnlyEstado> listEstado = estados
        .map((item) => _OnlyEstado(
              name: item.nombre,
              image: item.imagen,
              primaryColor: item.color1,
              secondColor: item.color2,
            ))
        .toList();
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(left: 8),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _MyEstado(),
          ...listEstado
          // _OnlyEstado(
          //   primaryColor: Color(0xffFC0B7B),
          //   secondColor: Color(0xff7820AD),
          //   name: 'Mau.H',
          // ),
        ],
      ),
    );
  }
}

class _MyEstado extends StatelessWidget {
  const _MyEstado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _OnlyEstado(
          primaryColor: Colors.white,
          secondColor: Colors.white,
          name: '',
          image: 'assets/friends/mau.jpg',
        ),
        Positioned(
            right: 30,
            bottom: 8,
            child: Container(
              width: 30,
              height: 30,
              child: Align(
                alignment: Alignment.center,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 10,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                  color: Colors.red,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffFC0B7B), Color(0xff7820AD)])),
            ))
      ],
    );
  }
}

class _OnlyEstado extends StatelessWidget {
  const _OnlyEstado({
    Key key,
    this.primaryColor,
    this.secondColor,
    this.name,
    this.image,
  }) : super(key: key);
  final Color primaryColor;
  final Color secondColor;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primaryColor, secondColor]),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              top: 2.6,
              left: 8.5,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(this.image))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        this.name.length != 0
            ? Text(
                this.name,
                style: TextStyle(fontSize: 11, color: Colors.white38),
              )
            : Container()
      ],
    );
  }
}

class _TitleHeader extends StatelessWidget {
  const _TitleHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.control_point,
            size: 20,
          ),
          Center(
              child: Text(
            'Instagram',
            style: TextStyle(
                letterSpacing: 0.3,
                fontSize: 50,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w100),
          )),
          _NotificacionIcon(),
        ]);
  }
}

class _NotificacionIcon extends StatelessWidget {
  const _NotificacionIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications),
        Positioned(
            top: -1.0,
            right: 0.0,
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.brightness_1,
                  size: 16.0,
                  color: Colors.redAccent,
                ),
                Positioned(
                    top: 2.0,
                    right: 4.5,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            ))
      ],
    );
  }
}
