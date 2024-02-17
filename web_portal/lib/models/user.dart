import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class User{
  String mailId;
  String uid;

  User({
    required this.mailId,
    required this.uid,
  });

  factory User.fromSnap(DocumentSnapshot snap) {
    return User(
      mailId: snap['mailId'],
      uid: snap['uid'],
    );
  }
}