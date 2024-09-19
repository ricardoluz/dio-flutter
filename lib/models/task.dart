// import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description;
  bool _completed = false;

  Task(this._description, this._completed);

  String getId() {
    return _id;
  }

  String getDescription(){
    return _description;
  }

  void setDescription(String description){
    _description = description;
  }

  bool getCompleted(){
    return _completed;
  }

  void setCompleted(bool completed){
    _completed = completed;
  }
}
