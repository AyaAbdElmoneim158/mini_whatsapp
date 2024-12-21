import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static final instance = FirestoreHelper._();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Set Data in Firestore ---------------------------------------------------
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {} catch (e) {
      debugPrint('setData :: Error: $e');
      rethrow;
    }
  }

  // Update Data in Firestore ------------------------------------------------
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final reference = _fireStore.doc(path);
      debugPrint('updateData :: Request Data: $data');
      await reference.update(data);
    } catch (e) {
      debugPrint('updateData :: Error: $e');
      rethrow;
    }
  }

  // Delete Data from Firestore ----------------------------------------------
  Future<void> deleteData({
    required String path,
  }) async {
    try {
      final reference = _fireStore.doc(path);
      debugPrint('deleteData :: Path: $path');
      await reference.delete();
    } catch (e) {
      debugPrint('deleteData :: Error: $e');
      rethrow;
    }
  }

  // Get Document Stream from Firestore --------------------------------------
  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    try {
      final reference = _fireStore.doc(path);
      final snapshots = reference.snapshots();
      return snapshots.map((snapshot) {
        return builder(snapshot.data(), snapshot.id);
      });
    } catch (e) {
      debugPrint('documentStream :: Error: $e');
      rethrow;
    }
  }

  // Get Collection Stream from Firestore ------------------------------------
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    try {
      Query query = _fireStore.collection(path);
      if (queryBuilder != null) {
        query = queryBuilder(query);
      }
      final snapshots = query.snapshots();
      return snapshots.map((snapshot) {
        final result = snapshot.docs
            .map(
              (doc) => builder(doc.data() as Map<String, dynamic>, doc.id),
            )
            .where((value) => value != null)
            .toList();
        if (sort != null) {
          result.sort(sort);
        }
        return result;
      });
    } catch (e) {
      debugPrint('collectionStream :: Error: $e');
      rethrow;
    }
  }

  // Add Data to Firestore ---------------------------------------------------
  Future<DocumentReference> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final reference = _fireStore.collection(path).doc();
      debugPrint('addData :: Request Data: $data');
      await reference.set(data);
      return reference;
    } catch (e) {
      debugPrint('addData :: Error: $e');
      rethrow;
    }
  }

  // Fetch Single Document from Firestore ------------------------------------
  Future<Map<String, dynamic>?> fetchDocument({
    required String path,
  }) async {
    try {
      final reference = _fireStore.doc(path);
      final snapshot = await reference.get();
      return snapshot.data();
    } catch (e) {
      debugPrint('fetchDocument :: Error: $e');
      rethrow;
    }
  }

  // Fetch Collection from Firestore -----------------------------------------
  Future<List<Map<String, dynamic>>> fetchCollection({
    required String path,
    Query Function(Query query)? queryBuilder,
  }) async {
    try {
      Query query = _fireStore.collection(path);
      if (queryBuilder != null) {
        query = queryBuilder(query);
      }
      final snapshot = await query.get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      debugPrint('fetchCollection :: Error: $e');
      rethrow;
    }
  }
}
