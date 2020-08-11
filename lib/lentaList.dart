import 'package:flutter/material.dart';
import 'package:kot_pes/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class Lenta extends StatefulWidget {
  @override
  _LentaState createState() => _LentaState();
}

class _LentaState extends State<Lenta> {
  //Информация животного
  _detailsPage(id) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: id,
            child: Image.network(
                'https://s1.stc.all.kpcdn.net/putevoditel/projectid_103889/images/tild3266-6236-4266-b833-393539393436__cat-3601092_1280.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text('инфа'),
          ),
          ListTile(
            title: SelectableText('213321123'),
            leading: Icon(Icons.phone),
          ),
          ListTile(
            title: InkWell(
                child: Text(
                  'вк',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => launch(
                      'https://vk.com/club96357315',
                    )),
            leading: Icon(Icons.mail),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Profile(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            floating: true,
            title: Text('Лента'),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  _detailsPage(index.toString())));
                    },
                    child: Hero(
                      tag: '$index',
                      child: ClipRRect(
                        child: Image.network(
                          'https://s1.stc.all.kpcdn.net/putevoditel/projectid_103889/images/tild3266-6236-4266-b833-393539393436__cat-3601092_1280.jpg',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
