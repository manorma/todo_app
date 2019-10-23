class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]); // for first time creation
  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]); // for editing the todo

  int get id => _id;

  int get priority => _priority;

  String get description => _description;

  String get title => _title;

  String get date => _date;

  set priority(int value) {
    if(value > 0 && value <=3) {
      _priority = value;
    }
  }

  set description(String value) {
    if (value.length < 255) {
      _description = value;
    }
  }

  set title(String value) {
    if (value.length < 255) {
      _title = value;
    }
  }

  set id(int value) {
    _id = value;
  }

  set date(String value) {
    _date = value;
  }


  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if(_id != null){
      map["id"] = _id;
    }

    return map;
  }

  Todo.fromObject(dynamic o){
    this._id = o["id"];
    this._priority = o["priority"];
    this._date = o["date"];
    this._title = o["title"];
    this._description = o["description"];

  }
}
