import 'package:flutter/material.dart';
import 'package:lachies_life_planner/shared/size_config.dart';

class EditTaskWidget extends StatefulWidget {
  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController.fromValue(
      TextEditingValue(
        text: '',
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightUnit * 80,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenWidthUnit * 7),
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none),
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _noteController,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(screenWidthUnit * 8),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(screenWidthUnit * 8),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      
                    },
                    child: Text('Add'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
