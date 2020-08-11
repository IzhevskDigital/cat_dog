import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //регистрация
  bool _isLoggedIn = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      _googleSignIn.currentUser.photoUrl,
                    ),
                  ),
                  Text(_googleSignIn.currentUser.displayName),
                  Text(_googleSignIn.currentUser.email),
                  OutlineButton(
                    child: Text("Logout"),
                    onPressed: () {
                      _logout();
                    },
                  )
                ],
              )
            : Center(
                child: OutlineButton(
                  child: Text("Login"),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
      ),
    );
  }
}

//страница создания поста
createPost(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              floating: true,
              title: Text('Создание'),
            ),
            SliverList(delegate: SliverChildListDelegate([])),
          ],
        ),
      );
    },
  ));
}

//настройки
settings(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Настройки'),
        ),
        body: Center(
          child: Text(
            'настройки',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}
