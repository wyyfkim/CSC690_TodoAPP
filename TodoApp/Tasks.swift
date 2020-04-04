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
//    class func createTaks(titile: String, deadline: String, description: String, completion: @escaping (_ error: Error?) -> Void ) {
//
//    }
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

