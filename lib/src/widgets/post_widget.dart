import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      margin: EdgeInsets.only(bottom: 50),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[_HeaderPost(), _HeaderBody(), _HeaderFooter()],
        ),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)),
    );
  }
}

class _HeaderFooter extends StatelessWidget {
  const _HeaderFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: 'Les gusta a ',
                style: TextStyle(color: Colors.white38),
                children: <TextSpan>[
                  TextSpan(
                      text: 'bitone.98 y 4,588 ',
                      style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'personas más'),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
                text: 'SACRIFICE | VIRUS ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'this photomanipulation inspired in the virus',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Ver los 500 comentarios',
            style: TextStyle(color: Colors.white38),
          )
        ],
      ),
    );
  }
}

class _HeaderBody extends StatelessWidget {
  const _HeaderBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/baby_groot.jpg'),
          ),
        ),
        Positioned(
          right: 15,
          top: 35,
          child: Container(
            height: 25,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Align(alignment: Alignment.center, child: Text('1/3')),
          ),
        ),
        Positioned(
            bottom: 15,
            left: 15,
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffDD2A7B)),
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '4,558',
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ))
      ],
    );
  }
}

class _HeaderPost extends StatelessWidget {
  const _HeaderPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/friends/mau.jpg'))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mau.H',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hace 20 min',
                      style: TextStyle(fontSize: 15, color: Colors.white38),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.send,
                  color: Colors.white38,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.grain,
                  color: Colors.white38,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
