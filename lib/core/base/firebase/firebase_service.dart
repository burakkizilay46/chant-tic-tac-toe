import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Belirli bir koleksiyondan veri çekme
  Future<List<Map<String, dynamic>>> getDataFromCollection(String collectionName) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
      List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
        // documentId'yi verinin içine ekleme
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        docData['documentId'] = doc.id;
        return docData;
      }).toList();
      return data;
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }

  // Belirli bir dokümandan veri çekme
  Future<Map<String, dynamic>?> getDocumentData(String collectionName, String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection(collectionName).doc(documentId).get();
      return documentSnapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      print("Error fetching document: $e");
      return null;
    }
  }

  // Koleksiyona veri ekleme
  Future<void> addDataToCollection(String collectionName, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).add(data);
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  // Dokümana veri güncelleme
  Future<void> updateDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).update(data);
    } catch (e) {
      print("Error updating document: $e");
    }
  }

  // Doküman silme
  Future<void> deleteDocument(String collectionName, String documentId) async {
    try {
      await _firestore.collection(collectionName).doc(documentId).delete();
    } catch (e) {
      print("Error deleting document: $e");
    }
  }
}
