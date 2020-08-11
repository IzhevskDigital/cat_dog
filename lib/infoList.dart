import 'package:flutter/material.dart';
import 'package:kot_pes/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Информация'),
        ),
        drawer: Drawer(
          child: Profile(),
        ),
        body: Column(
          children: <Widget>[
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Center(
                      child: Text(
                    'Приют\n"Кот и пес"',
                    style: TextStyle(fontSize: 36),
                  )),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Image.network(
                        'https://sun1-21.userapi.com/QuBAgf5R-Vow1WJ6ZWrxpbDvFcqdHywwcNTlkg/7jzFHnDn_uw.jpg'),
                  ),
                ])
              ],
            ),
            Column(
              children: <Widget>[
                InkWell(
                    child: ListTile(
                      title: Text(
                        'Группа VK',
                        style: TextStyle(color: Colors.blue),
                      ),
                      leading: Icon(Icons.public, color: Colors.blue),
                    ),
                    onTap: () => launch(
                          'https://vk.com/club96357315',
                        )),
                ListTile(
                  title: SelectableText('Телефон'),
                  leading: Icon(Icons.phone),
                ),
                ListTile(
                  title: SelectableText('Реквизиты'),
                  leading: Icon(Icons.credit_card),
                ),
                ListTile(
                  title: SelectableText('Адрес'),
                  leading: Icon(Icons.room),
                ),
                ListTile(
                  onTap: () => mapLocation(context),
                  title: Text('Карта'),
                  leading: Icon(Icons.map),
                ),
              ],
            )
          ],
        )
        /*Table(children: [
        TableRow(children: [
          
        ]),
        TableRow(children: [
          
        ]),
        TableRow(children: [
          
        ]),
        TableRow(children: [
          
        ]),
        TableRow(children: [
          
        ]),
        TableRow(children: [
          
        ])
      ]),*/
        );
  }
}

mapLocation(BuildContext context) {
  final CameraPosition _cameraPosition = CameraPosition(
    zoom: 14,
    target: LatLng(56.802172, 53.239406),
  );

  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Карта'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: GoogleMap(
            rotateGesturesEnabled: false,
            initialCameraPosition: _cameraPosition,
            mapType: MapType.normal,
            markers: Set<Marker>.of([
              Marker(
                  markerId: MarkerId('0'),
                  position: LatLng(56.802172, 53.239406))
            ]),
          ),
        ),
      );
    },
  ));
}
