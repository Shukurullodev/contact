import 'package:contact/utils/myicons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'my_contact_info.dart';

class FakeData {
  static List<MyContactInfo> getMyFakeContacts() {
    List<MyContactInfo> myContactInfo = [];
    myContactInfo.add(MyContactInfo(
        contactName: "Shukurullo",
        contactNumber: "+998 90 377 39 96",
        iconPath: MyIcons.cloud ));
    return myContactInfo;
  }
}
