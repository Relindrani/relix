import 'package:flutter/material.dart';

import '../models/steam_item.dart';

class GameTileTest extends StatelessWidget{
  final SteamItem _item;
  GameTileTest(this._item);

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(_item.name),
          subtitle: Text(_item.appId.toString()),
          leading: Container(
            child: (_item.logoUrl != null) ? Image.network('http://media.steampowered.com/steamcommunity/public/images/apps/'+ _item.appId.toString() + '/' + _item.logoUrl + '.jpg', height: 50.0, fit: BoxFit.fill) : Container(),
          ),
        ),
        Divider()
      ],
    );
  }
}