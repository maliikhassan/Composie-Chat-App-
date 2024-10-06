import 'package:flutter/material.dart';
class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8,left: 8,right: 8),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple,width: 2)
        ),
        child: Row(
          children: [
            const Icon(Icons.person,color: Colors.deepPurple,),
            SizedBox(width: 12,),
            Text(text,style: TextStyle(fontFamily: "composie",fontSize: 18),),

          ],
        ),
      ),
    );
  }
}
