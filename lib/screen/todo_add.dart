import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: "Note title",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: "Note description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Priority',
                hintText: "e.g. 1,2,3",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: "e.g. 12/12/2019",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: RaisedButton(
                child: Text(
                  'Create',
                  textScaleFactor: 1.5,
                ),
                onPressed: null),
          ),
        ],
      ),
    );
  }
}
