import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'my_contact_info.dart';

class FakeData {
  static List<MyContactInfo> getMyFakeContacts() {
    List<MyContactInfo> myContactInfo = [];
    for (int i = 0; i < 100; i++) {
      myContactInfo.add(MyContactInfo(
          contactName: "Shukurullo $i",
          contactNumber: "+998 90 377 39 96",
          iconPath: " "));
    }
    return myContactInfo;
  }
}
