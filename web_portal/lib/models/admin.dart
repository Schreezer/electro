import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class Admin{
  String mailId;
  String uid;

  Admin({
    required this.mailId,
    required this.uid,
  });
  
  factory Admin.fromSnap(DocumentSnapshot snap) {
    return Admin(
      mailId: snap['mailId'],
      uid: snap['uid'],
    );
  }
}