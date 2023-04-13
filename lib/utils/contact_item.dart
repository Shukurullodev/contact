import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  ContactItem({
    Key? key,
    required this.iconPath,
    required this.contactName,
    required this.number,
    required this.onTap,
    required this.isSelected,
    required this.deleteClicked, required this.updateClicked,
  }) : super(key: key);

  final VoidCallback deleteClicked;
  final String iconPath;
  final String contactName;
  final String number;
  final VoidCallback onTap;
  final VoidCallback updateClicked;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
            color: isSelected ? Colors.green.shade500 : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, 3),
                  color: Colors.grey.shade300),
            ]),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 60,
              height: 60,
              // color: isSelected ? Colors.white : Colors.black38,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactName,
                    style: TextStyle(
                        fontSize: 20,
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white : Colors.grey),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: deleteClicked,
              child: Icon(
                Icons.delete,
                size: 24,
                color: Colors.red,
              ),
            ),
            TextButton(
              onPressed: updateClicked,
              child: Icon(
                Icons.edit,
                size: 24,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
