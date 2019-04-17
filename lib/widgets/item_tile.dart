import 'package:flutter/material.dart';

import 'dart:convert';

import '../models/item.dart';
import '../models/itemTypes.dart';

class ItemTile extends StatelessWidget{
  final dynamic _item;
  ItemTile(this._item);

  @override
  Widget build(BuildContext context){
    return Card(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: (_item.picPath != null) ? (_item is Game && _item.isSteamGame) ? Image.network(_item.picPath) : Image.memory(base64.decode(_item.picPath)): Container()
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    left: 5.0,
                    right: 5.0,
                    child: Text(_item.name, textAlign: TextAlign.center,maxLines: 2,),
                  ),
                  Positioned(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                    child: Text(formatText(_item.category.toString()), textAlign: TextAlign.center,)
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () => print("tap"),
      ),
    );
  }

  String formatText(String s){
    s = s.substring(s.indexOf('.') + 1, s.indexOf('.') + 2).toUpperCase() + s.substring(s.indexOf('.') + 2).toLowerCase();
    if(s.contains('_'))s = s.substring(0, s.indexOf('_')) + ' ' + s.substring(s.indexOf('_') + 1, s.indexOf('_') + 2).toUpperCase() + s.substring(s.indexOf('_') + 2).toLowerCase();
    return s;
  }
}