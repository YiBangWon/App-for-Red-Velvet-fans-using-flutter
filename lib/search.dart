
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String _locationValue = 'Seoul';
  String _roomValue = 'Single';
  List<bool> _classValue = [false,false,false,false,false];
  bool _isNotDecided = false;
  DateTime _checkInDate = DateTime.now();
  DateTime _checkOutDate = DateTime.now();
  TimeOfDay _checkInTime = TimeOfDay.now();
  TimeOfDay _checkOutTime = TimeOfDay.now();
  double _fee = 150.0;

  Future<Null> _setCheckInDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _checkInDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _checkInDate)
      setState(() {
        _checkInDate = picked;
      });
  }

  Future<Null> _setCheckInTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (picked != null && picked != _checkInTime) 
      setState(() {
        _checkInTime = picked;
      });
  }

  Future<Null> _setCheckOutDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _checkOutDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _checkOutDate)
      setState(() {
        _checkOutDate = picked;
      });
  }

  Future<Null> _setCheckOutTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if (picked != null && picked != _checkOutTime) 
      setState(() {
        _checkOutTime = picked;
      });
  }



  void _locationOnChanged(String value) {
    setState(() {
     _locationValue = value; 
    });
  }

  void _roomOnChanged(String value) {
    setState(() {
     _roomValue = value; 
    });
  }

  void _classOnChanged(int index, bool value) {
    setState(() {
     _classValue[index] = value; 
    });
  }

  void _decideOnChanged(bool value ){
    setState(() {
     _isNotDecided = value; 
    });
  }

  void _feeOnChanged(double value) {
    setState(() {
     _fee = value; 
    });
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            width: double.infinity,
            child: Text(
              'Please check your choice :)'
            ),
          ),
          actions: [
            RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0
                ),
              ),
              onPressed: Navigator.of(context).pop,
            ),
            RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              color: Colors.grey,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0
                ),
              ),
              onPressed: Navigator.of(context).pop,
            )
          ],
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_on,color: Colors.blue),
                    Text(_locationValue)
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.dashboard,color: Colors.blue),
                    Text(_roomValue)
                  ],
                ),
                SizedBox(height: 30.0),
                Column(
                  children: [
                    Icon(Icons.star_border,color: Colors.yellow,size: 50.0),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _classValue[0] ? Row(children: List.generate(1, (_)=>Icon(Icons.star,color: Colors.yellow)))
                        : Container(),
                        _classValue[0] ? Text(' / ') : Container(),
                        _classValue[1] ? Row(children: List.generate(2, (_)=>Icon(Icons.star,color: Colors.yellow)))
                        : Container(),
                        _classValue[1] ? Text(' / ') : Container(),
                        _classValue[2] ? Row(children: List.generate(3, (_)=>Icon(Icons.star,color: Colors.yellow)))
                        : Container(),
                        _classValue[2] ? Text(' / ') : Container(),
                        _classValue[3] ? Row(children: List.generate(4, (_)=>Icon(Icons.star,color: Colors.yellow)))
                        : Container(),
                        _classValue[3] ? Text(' / ') : Container(),
                        _classValue[4] ? Row(children: List.generate(5, (_)=>Icon(Icons.star,color: Colors.yellow)))
                        : Container()
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today,color: Colors.blue),
                    SizedBox(height: 30.0),
                    Column(
                      children: [
                        Text(
                          'CHECK IN: ' + DateFormat('yyyy-MM-dd').format(_checkInDate)
                          + ' ' + _checkInTime.format(context).toString()
                        ),
                        Text(
                          'CHECK OUT: ' + DateFormat('yyyy-MM-dd').format(_checkOutDate)
                          + ' ' + _checkOutTime.format(context).toString()
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        );
      },
    );
  }

  List<bool> _isExpaned = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (index,isExpanded){
              setState(() {
                _isExpaned[index] = !_isExpaned[index];
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (_,__) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Location',style: TextStyle(fontSize: 20.0)),
                      Text('select location')
                    ],
                  );
                },
                isExpanded: _isExpaned[0],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Seoul'),
                        value: 'Seoul',
                        groupValue: _locationValue,
                        onChanged: _locationOnChanged,
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Busan'),
                        value: 'Busan',
                        groupValue: _locationValue,
                        onChanged: _locationOnChanged,
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Daegu'),
                        value: 'Daegu',
                        groupValue: _locationValue,
                        onChanged: _locationOnChanged,
                      ),
                    )
                  ],
                )
              ),
              ExpansionPanel(
                headerBuilder: (_,__) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Room',style: TextStyle(fontSize: 20.0)),
                      Text('select room')
                    ],
                  );
                },
                isExpanded: _isExpaned[1],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Single'),
                        value: 'Single',
                        groupValue: _roomValue,
                        onChanged: _roomOnChanged,
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Double'),
                        value: 'Double',
                        groupValue: _roomValue,
                        onChanged: _roomOnChanged,
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: RadioListTile(
                        title: Text('Family'),
                        value: 'Family',
                        groupValue: _roomValue,
                        onChanged: _roomOnChanged,
                      ),
                    )
                  ],
                )
              ),
              ExpansionPanel(
                headerBuilder: (_,__) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Class',style: TextStyle(fontSize: 20.0)),
                      Text('select class')
                    ],
                  );
                },
                isExpanded: _isExpaned[2],
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _classValue[0],
                            onChanged: (value) => _classOnChanged(0, value),
                          ),
                          _buildStar(1)
                        ],
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _classValue[1],
                            onChanged: (value) => _classOnChanged(1, value),
                          ),
                          _buildStar(2)
                        ],
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _classValue[2],
                            onChanged: (value) => _classOnChanged(2, value),
                          ),
                          _buildStar(3)
                        ],
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _classValue[3],
                            onChanged: (value) => _classOnChanged(3, value),
                          ),
                          _buildStar(4)
                        ],
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _classValue[4],
                            onChanged: (value) => _classOnChanged(4, value),
                          ),
                          _buildStar(5)
                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Date',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
                    Spacer(),
                    Text('I don\'t decide yet'),
                    Switch(
                      value: _isNotDecided,
                      onChanged: _decideOnChanged,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            Text('Check In')
                          ],
                        ),
                        Text(DateFormat('yyyy-MM-dd').format(_checkInDate)),
                        Text(_checkInTime.format(context).toString())
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      children: [
                        RaisedButton(
                          child: Text('select date'),
                          color: _isNotDecided ? Colors.grey : Colors.lightBlue,
                          onPressed: () async => _isNotDecided ? null : _setCheckInDate(context),
                        ),
                        RaisedButton(
                          child: Text('select time'),
                          color: _isNotDecided ? Colors.grey : Colors.lightBlue,
                          onPressed: ()async => _isNotDecided ? null : _setCheckInTime(context),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            Text('Check Out')
                          ],
                        ),
                        Text(DateFormat('yyyy-MM-dd').format(_checkOutDate)),
                        Text(_checkOutTime.format(context).toString())
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      children: [
                        RaisedButton(
                          child: Text('select date'),
                          color: _isNotDecided ? Colors.grey : Colors.lightBlue,
                          onPressed: () async => _isNotDecided ? null : _setCheckOutDate(context),
                        ),
                        RaisedButton(
                          child: Text('select time'),
                          color: _isNotDecided ? Colors.grey : Colors.lightBlue,
                          onPressed: ()async => _isNotDecided ? null : _setCheckOutTime(context),
                        )
                      ],
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Fee',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
                    Spacer(),
                    Text('Up to \$${_fee.round()}'),
                  ],
                ),
                SizedBox(height: 30.0),
                Slider(
                  value: _fee,
                  min: 0.0,
                  max: 1000.0,
                  onChanged: _feeOnChanged,
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () => _showAlertDialog(),
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                  shape: RoundedRectangleBorder(),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

Widget _buildStar(int count) {
  return Row(
    children: List.generate(count, (_) => Icon(Icons.star,color: Colors.yellow)),
  );
}



