import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textify_demo/models/message.dart';

class ChatServices {
  // instance of firestore
final FirebaseFirestore _firestore= FirebaseFirestore.instance;
final FirebaseAuth _auth=FirebaseAuth.instance;
  //user stream
  /*
  List<Map<string,dynamic>>
  {
  'email': test@gmail.com,
  'id': 542765412345123456
  }
  {
  'email': test1@gmail.com,
  'id': 5427654122356
  }
   */
Stream<List<Map<String,dynamic>>> getUserStream(){
return _firestore.collection("users").snapshots().map((snapshot){
  return snapshot.docs.map((doc){
// har user ke pass jana
final user = doc.data();
return user;
  }).toList();
});
}
  //send message
Future<void> sendMessage(String receiverID, String message) async {
  String currentUserID = _auth.currentUser!.uid;
  String currentUserEmail = _auth.currentUser!.email!;

  List<String> ids = [currentUserID, receiverID];
  ids.sort();
  String chatRoomID = ids.join("_");

  Message newMessage = Message(
    senderID: currentUserID,
    senderEmail: currentUserEmail,
    receiverID: receiverID,
    message: message,
    timestamp: Timestamp.now(),
  );

  await _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .add(newMessage.toMap());
}

  //get message
  Stream<QuerySnapshot> getMessages(String userID,otherUserID){
    List<String> ids= [userID,otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp",descending: false).snapshots();
  }
}
