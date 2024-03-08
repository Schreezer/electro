import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:web_portal/models/admin.dart" as model;
import "package:web_portal/models/user.dart";
import "package:web_portal/widgets/house_Card.dart";

import "../providers/userProvider.dart";

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  var webScreenSize = 600;
  @override
  Widget build(BuildContext context) {
    final User? admin = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("posts").orderBy("bounty", descending: true).snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            // Future.delayed(Duration(seconds: 3), () {
            //   print(snapshot.connectionState);
            // });
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // print("hello");

            return ListView.builder(
              
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: width > webScreenSize ? 15 : 0,
                  horizontal: width > webScreenSize ? width * 0.3 : 0,
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: HouseCard(
                    houseNumber: snapshot.data!.docs[index].data()[''],
                    indexNumber: index,
                    name: snapshot.data!.docs[index].data()['name'],
                  ),
                ),
              ),
              
            );
          },
        )
    );
  }
}