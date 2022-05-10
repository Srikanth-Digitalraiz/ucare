// import 'package:Myclinic/Service/Firebase/readdata.dart';
// import 'package:Myclinic/Service/DateAndTimeCalculation/timecalculation.dart';
// import 'package:Myclinic/SetData/globlvariables.dart';
// import 'package:Myclinic/SetData/screenarg.dart';
// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/loadingindicator.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:ucare/Service/DateAndTimeCalculation/timecalculation.dart';
import 'package:ucare/Service/Firebase/readdata.dart';
import 'package:ucare/SetData/globlvariables.dart';
import 'package:ucare/SetData/screenarg.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/loadingindicator.dart';

class ChooseTimeSlotPage extends StatefulWidget {
  ChooseTimeSlotPage({Key key}) : super(key: key);

  @override
  _ChooseTimeSlotPageState createState() => _ChooseTimeSlotPageState();
}

class _ChooseTimeSlotPageState extends State<ChooseTimeSlotPage> {
  bool _isLoading = false;
  String _setTime = "";
  var _selectedDate;

  Map _bookedTimeSlots;
  List<dynamic> _morningTimeSlotsList = [];
  List<dynamic> _afternoonTimeSlotsList = [];
  List<dynamic> _eveningTimeSlotsList = [];

  String _openingTimeHour = "";
  String _openingTimeMin = "";
  String _closingTimeHour = "";
  String _closingTimeMin = "";

  @override
  void initState() {
    super.initState();
    _getAndSetAllInitialData();
  }

  _getAndSetAllInitialData() async {
    setState(() {
      _isLoading = true;
    });

    _initializeDate(); //Initialize start time
    await _getAndSetbookedTimeSlots();
    await _getAndSetOpeningClosingTime();
    _getAndsetTimeSlots(
        _openingTimeHour, _openingTimeMin, _closingTimeHour, _closingTimeMin);

    setState(() {
      _isLoading = false;
    });
  }

  _initializeDate() {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.month}-${dateParse.day}-${dateParse.year}";

    _selectedDate = formattedDate;
  }

  Future<void> _getAndSetbookedTimeSlots() async {
    _bookedTimeSlots =
        await ReadData().fetchBookedTime(GlobalVariables.selectedClinicId);
  }

  Future<void> _getAndSetOpeningClosingTime() async {
    var openingClosingTime = await ReadData().fetchOpeningClosingTime(
        GlobalVariables
            .selectedClinicId); //fetch clinic opening and closing time

    //break the opening and closing time in to the hour and minute
    _openingTimeHour = (openingClosingTime["openingTime"]).substring(0, 2);
    _openingTimeMin = (openingClosingTime["openingTime"]).substring(3, 5);
    _closingTimeHour = (openingClosingTime["closingTime"]).substring(0, 2);
    _closingTimeMin = (openingClosingTime["closingTime"]).substring(3, 5);
  }

  _getAndsetTimeSlots(String openingTimeHour, String openingTimeMin,
      String closingTimeHour, String closingTimeMin) {
    int serviceTime = GlobalVariables.selctedServiceTime;

    List<String> timeSlots = TimeCalculation.calculateTimeSlots(
        openingTimeHour,
        openingTimeMin,
        closingTimeHour,
        closingTimeMin,
        serviceTime); //calculate all the possible time slots between opening and closing time

    //  print("Service Time" + " " + "$serviceTime");
    print("...................." + "$timeSlots");

    if (_bookedTimeSlots[_selectedDate] != null) {
      //if any booked time exists on the selected day
      timeSlots = TimeCalculation.reCalculateTimeSlots(
          timeSlots,
          _bookedTimeSlots,
          _selectedDate,
          closingTimeHour,
          closingTimeMin,
          GlobalVariables
              .selctedServiceTime); // Recalculate the time according to the booked time slots and date
    }
    // print("+++++++++++++++++++++++++ $timeSlots");

    _arrangeTimeSlots(
        timeSlots); //separate the time according to morning, afternoon and evening slots
  }

  _arrangeTimeSlots(List timeSlots) {
    _morningTimeSlotsList.clear();
    _afternoonTimeSlotsList.clear();
    _eveningTimeSlotsList.clear();

    timeSlots.forEach((element) {
      if (int.parse(element.substring(0, 2)) < 12)
        _morningTimeSlotsList.add(element);

      if (int.parse(element.substring(0, 2)) >= 12 &&
          int.parse(element.substring(0, 2)) < 17)
        _afternoonTimeSlotsList.add(element);

      if (int.parse(element.substring(0, 2)) >= 17 &&
          int.parse(element.substring(0, 2)) < 24)
        _eveningTimeSlotsList.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ServiceScrArg _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBars()
            .bottomNavigationBarWithState(context, "Next", _setTime, () {
          Navigator.pushNamed(context, "/RegisterPatientPage",
              arguments: ChooseTimeScrArg(
                _args.serviceName,
                _args.serviceTimeMin,
                _setTime,
                _selectedDate,
              ));
        }),
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AppBars().commonAppBar(context, "Book an appointment"),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //     padding: const EdgeInsets.only(
                      //         top: 20.0, left: 20, right: 10),
                      //     child: Center(
                      //         child: Text("What type of appointment",
                      //             style: kTitleStyle3))
                      //             ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 10, right: 10),
                          child: SingleChildScrollView(
                            // controller: _scrollController,
                            child: Column(
                              children: <Widget>[
                                _buildCalendar(),
                                Divider(),
                                _isLoading
                                    ? Center(
                                        child: LoadingIndicator()
                                            .circularIndicator())
                                    : Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Morning Time Slot"),
                                          ),
                                          _slotsGridView(
                                              _morningTimeSlotsList,
                                              _bookedTimeSlots[_selectedDate],
                                              _args.serviceTimeMin),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Afternoon Time Slot"),
                                          ),
                                          _slotsGridView(
                                              _afternoonTimeSlotsList,
                                              _bookedTimeSlots[_selectedDate],
                                              _args.serviceTimeMin),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Evening Time Slot"),
                                          ),
                                          _slotsGridView(
                                              _eveningTimeSlotsList,
                                              _bookedTimeSlots[_selectedDate],
                                              _args.serviceTimeMin),
                                        ],
                                      )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildCalendar() {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.indigo,
      selectedTextColor: Colors.white,
      onDateChange: (date) {
        // New date selected
        setState(() {
          final dateParse = DateTime.parse(date.toString());

          _selectedDate =
              "${dateParse.month}-${dateParse.day}-${dateParse.year}";

          _getAndsetTimeSlots(_openingTimeHour, _openingTimeMin,
              _closingTimeHour, _closingTimeMin);
        });
      },
    );
  }

  Widget _slotsGridView(timeSlotsList, bookedTimeSlot, serviceTimeMin) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: timeSlotsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 1, crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return _timeSlots(timeSlotsList[index], bookedTimeSlot, serviceTimeMin);
      },
    );
  }

  Widget _timeSlots(String time, bookedTime, serviceTimeMin) {
    bool _isNoRemainingTime=false;

    if(int.parse(time.substring(0,2))<DateTime.now().hour){
      //true the time is over

      _isNoRemainingTime=true;

    }
    else if(int.parse(time.substring(0,2))==DateTime.now().hour)
      {
        //false
        if(int.parse(time.substring(3,5))<=DateTime.now().minute){
          _isNoRemainingTime=true;

        }
      }
    print(time);
    print(_isNoRemainingTime);

    var bookedTimeSlots = [];

    if (bookedTime != null) {
      bookedTimeSlots = TimeCalculation.calculateBookedTime(
          time, bookedTime, serviceTimeMin); //get all disabled time
    }

    return GestureDetector(
      onTap: _isNoRemainingTime||

      bookedTimeSlots.contains(time)
          ? null
          : () {
              setState(() {
                _setTime == time ? _setTime = "" : _setTime = time;
              });
            },
      child: Container(
        child: Card(
          color: time == _setTime
              ? setbtnColor
              :  _isNoRemainingTime|| bookedTimeSlots.contains(time)
                  ? Colors.grey[200]
                  : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                    color: time == _setTime ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
