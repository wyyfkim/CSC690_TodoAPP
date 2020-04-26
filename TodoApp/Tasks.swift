//
//  Tasks.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class Task {

    let objectId: String
    var title: String?
    var deadline: String?
    var description: String?

    //MARK: Initializers
    init(_objectId: String, _title: String, _deadline: String, _description: String) {
        objectId = _objectId
        title = _title
        deadline = _deadline
        description = _description
    }
}

func CreateTaskInFirestore(withValues : [String : Any], completion: @escaping (_ error: Error?) -> Void) {
  
    var ref : DocumentReference? = nil
    ref = Firestore.firestore().collection("Task").addDocument(data: withValues) {(err) in
        if err != nil {
            print(err!.localizedDescription)
        } else {
            print("Document added with ID: \(ref!.documentID)")
        }
    
    }
}

func UpdateTaskInFirestore(taskID: String, withValues : [String : Any], completion: @escaping (_ error: Error?) -> Void) {
    print(taskID)
    Firestore.firestore().collection("Task").document(taskID).setData(withValues) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}

func GetTasksInFirestore(compelte: Bool, completion:@escaping(_ querySnapshot:[QueryDocumentSnapshot])->Void) {
    Firestore.firestore().collection("Task").whereField("complete", isEqualTo: compelte).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            if let documents = querySnapshot?.documents{
                completion(documents)
            }
        }

    }
}


