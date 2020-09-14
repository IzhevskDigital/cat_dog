import 'package:flutter/material.dart';
import 'package:kot_pes/profile.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //Информация животного
  _detailsPage(id) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: id,
            child: Image.network(
                'https://sun1-83.userapi.com/pG8qjz_LYLwR2m_NrgZD0WIdYeRAbGDoaZ9drQ/vUtLAaKnE24.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text('инфа'),
          ),
          ListTile(
            title: SelectableText('213321123'),
            leading: Icon(Icons.phone),
          ),
        ],
      ),
    );
  }

  //Умный поиск
  smartSeaarch(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Умный поиск'),
          ),
          body: Center(
            child: Text(
              'умный поиск',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
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
            title: Text('Животные приюта'),
            elevation: 0,
            floating: true,
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
                          'https://sun1-83.userapi.com/pG8qjz_LYLwR2m_NrgZD0WIdYeRAbGDoaZ9drQ/vUtLAaKnE24.jpg',
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
