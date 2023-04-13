import 'package:contact/utils/contact_item.dart';
import 'package:contact/utils/fake_data.dart';
import 'package:contact/utils/my_contact_info.dart';
import 'package:contact/utils/utility_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(370, 812),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter",
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyContactInfo> list = FakeData.getMyFakeContacts();

  int activeIndex = -1;
  String contactName = "";
  String contactNumber = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    numberController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        leading: const Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  // list.add(
                  //   MyContactInfo(
                  //       contactName: "contactName",
                  //       contactNumber: "contactNumber",
                  //       iconPath: "iconPath"),
                  // );
                  // UtilityFunction.getMyToasts(
                  //     message: "contact added ${list.length}");
                  myCustomDialog();
                });
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(
          list.length,
          (index) => ContactItem(
            iconPath: list[index].iconPath,
            contactName: list[index].contactName,
            number: list[index].contactNumber,
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            isSelected: activeIndex == index,
            deleteClicked: () {
              setState(() {
                UtilityFunction.getMyToasts(message: "Contact $index deleted");
                if (activeIndex == index) activeIndex = -1;
                list.removeAt(index);
              });
            },
            updateClicked: () {
              myCustomDialogUpdate(
                myContactInfo: list[index],
                updateIndex: index,
              );
            },
          ),
        ),
      ),
    );
  }

  void myCustomDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Enter contact info",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    controller: nameController,
                    // onChanged: (value) {
                    //   contactName = value;
                    // },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Enter name",
                    ),
                  ),
                  TextField(
                    controller: numberController,
                    // onChanged: (value) {
                    //   contactNumber = value;
                    // },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter number",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        contactName = nameController.text;
                        contactNumber = numberController.text;
                        if (contactName.isNotEmpty &&
                            contactNumber.isNotEmpty) {
                          list.add(
                            MyContactInfo(
                                contactName: contactName,
                                contactNumber: contactNumber,
                                iconPath: ""),
                          );
                          UtilityFunction.getMyToasts(message: "Contact Added");
                        } else {
                          UtilityFunction.getMyToasts(message: "Enter inputs");
                        }
                        // Navigator.pop(context);
                        // contactName = '';
                        // contactNumber = '';
                        nameController.clear();
                        numberController.clear();
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      "Save contact",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void myCustomDialogUpdate(
      {required MyContactInfo myContactInfo, required int updateIndex}) {
    numberController.text = myContactInfo.contactNumber;
    nameController.text = myContactInfo.contactName;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Enter contact info",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Enter name",
                    ),
                  ),
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter number",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        contactName = nameController.text;
                        contactNumber = numberController.text;
                        if (contactName.isNotEmpty &&
                            contactNumber.isNotEmpty) {
                          list[updateIndex] = MyContactInfo(
                              contactName: contactName,
                              contactNumber: contactNumber,
                              iconPath: "");
                          UtilityFunction.getMyToasts(
                              message: "Contact Updated");
                        } else {
                          UtilityFunction.getMyToasts(message: "Enter inputs");
                        }
                        nameController.clear();
                        numberController.clear();
                        Navigator.pop(context);
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      "Save contact",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  AlertDialog getMyAlert() => AlertDialog(
        title: Text("Alert Dialog"),
        content: Text("Content ALert"),
      );
}
