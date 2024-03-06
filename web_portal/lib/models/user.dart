import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class User{
  String mailId;
  String uid;
  String houseId;
  String name;
  User({
    required this.houseId,
    required this.name,
    required this.mailId,
    required this.uid,
  });

  factory User.fromSnap(DocumentSnapshot snap) {
    return User(
      name: snap['name'],
      houseId: snap['houseId'],
      mailId: snap['mailId'],
      uid: snap['uid'],
    );
  }
}