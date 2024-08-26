import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testapi/data/api/api_value.dart';

import 'form_info_screen.dart';
import 'welcome_screen.dart';

List dayFirstNameList = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
List dayList = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
final Map<String, dynamic> businessHours = {
  'mon': [],
  'tue': [],
  'wed': [],
  'thu': [],
  'fri': [],
  'sat': [],
  'sun': [],
};

class BusinessHoursScreen extends StatefulWidget {
  const BusinessHoursScreen({super.key});

  @override
  State<BusinessHoursScreen> createState() => BusinessHoursScreenState();
}

class BusinessHoursScreenState extends State<BusinessHoursScreen> {
            ApiContainer apiContainer =ApiContainer();
  updateBusinessHours(String day, List<String> timeSlot, String timeStamp) {
    if (businessHours[day]!.contains(timeStamp)) {
      businessHours[day]!.remove(timeStamp);
    } else {
      businessHours[day]!.add(timeStamp);
    }
    
  }

  final List<String> _timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 6:00pm',
  ];

  int selectedDayValue = 0;
  String selectedDay = 'mon';
  List<String> selectdTimeStamp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business hours"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dayFirstNameList.length,
                itemBuilder: (context, index) {
                  final isSelectedDay = selectedDayValue == index;
                  return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                      onTap: () {
                        selectdTimeStamp.clear();
                        setState(() {
                          selectedDay = dayList[index];
                          selectedDayValue = index;
                        });
                        // if(selectedDay==index){
                        //   isSelectedDay=true;
                        //   setState(() {

                        //   });
                        // }
                        // else{
                        //   isSelectedDay=false;
                        //   setState(() {

                        //   });
                        // }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isSelectedDay
                                ? Color.fromARGB(158, 255, 235, 59)
                                : null,
                            border: Border.all(
                              width: 1,
                            )),
                        child: Text(dayFirstNameList[index]),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _timeSlots.length,
                itemBuilder: (context, index) {
                  // final isSelectedDay= selectedDay==index;
                  return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                      onTap: () {
                        final onTapIndexvalue = index;
                        if (selectdTimeStamp.contains(_timeSlots[index])) {
                          setState(() {
                            selectdTimeStamp.remove(_timeSlots[index]);
                          });
                        } else {
                          setState(() {
                            selectdTimeStamp.add(_timeSlots[index]);
                          });
                        }
                        print(onTapIndexvalue);
                        log("This is selected day $selectedDay and this is selcted timeStamp=${selectdTimeStamp}");
                        updateBusinessHours(selectedDay, selectdTimeStamp,
                            _timeSlots[onTapIndexvalue]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // color: selectdTimeStamp.contains(_timeSlots[index])
                            //     ? Color.fromARGB(158, 255, 235, 59)
                            //     : null,
                            color: businessHours[selectedDay]!
                                    .contains(_timeSlots[index])
                                ? Color.fromARGB(158, 255, 235, 59)
                                : null,
                            border: Border.all(
                              width: 1,
                            )),
                        child: Text(_timeSlots[index]),
                      ),
                    ),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: ()async {
                Map businessHoursMap = {
                  "business_hours": businessHours,
                  "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
                  "type": "email/facebook/google/apple",
                  "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
                };
                Map combinationMap = {
                  ...apiData,
                  ...apiFormData,
                  ...businessHoursMap,
                };

       Map<String,dynamic>  dataMap=       {
  "full_name": "john doe",
  "email": "johndoe@mail.com",
  "phone": "+19876543210",
  "password": "12345678",
  "role": "farmer",
  "business_name": "Dairy Farm",
  "informal_name": "London Dairy",
  "address": "3663 Marshville Road",
  "city": "Poughkeepsie",
  "state": "New York",
  "zip_code": 12601,
  "registration_proof": "my_proof.pdf",
  "business_hours": {
    "mon": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm"
    ],
    "tue": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm"
    ],
    "wed": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm",
      "1:00pm - 4:00pm"
    ],
    "thu": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm",
      "1:00pm - 4:00pm"
    ],
    "fri": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm"
    ],
    "sat": [
      "8:00am - 10:00am",
      "10:00am - 1:00pm"
    ],
    "sun": [
      "8:00am -10:00am"
    ]
  },
  "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
  "type": "email/facebook/google/apple",
  "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
};
                setState(() {});
               var res= await apiContainer.signUp(data: dataMap);
                print(res);
              },
              child: const Text("Send Data"))
        ],
      ),
    );
  }
}
