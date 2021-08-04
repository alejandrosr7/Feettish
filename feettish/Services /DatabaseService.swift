//
//  DatabaseService.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 19/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import FirebaseFirestore
import Firebase

// Mark: - Authetication

let database = Firestore.firestore()
let firebaseData = DatabaseService()

class DatabaseService: ObservableObject {

    @Published var userData = UserAuthentication(uid: "", email: "", isProvider: 0)
    
    let storage = Storage.storage().reference()

    init() {
        
    }

    func signInWebService(provider: User, completion: @escaping (Int?,Error?) -> ()) {
        Auth.auth().signIn(withEmail: provider.user.email, password: provider.user.password) { (result, error) in
            if error != nil {
                completion(nil, error)
            } else {
                database.collection(Constants.feettisher).document(Auth.auth().currentUser!.uid).getDocument { (document, error) in
                    if let document = document {
                        completion(document.data()?["isProvider"] as? Int, nil)
                    }
                }
            }
        }
    }
}

// Mark: - Firestore
extension DatabaseService {

    func saveUserInformation(with provider: User, userID: String) {
        let providerDictionary = ["firstName" : provider.firstName, "lastName" : provider.lastName, "phone" : provider.phone, "email" : provider.user.email, "isProvider" : provider.user.isProvider] as [String : Any]

        database.collection(Constants.feettisher).document(userID).setData(providerDictionary)
    }

    func readUserData(with user: UserAuthentication) {
        let query = database.collection(Auth.auth().currentUser!.uid)
    }
}

// Mark: - Firebase Storage
extension DatabaseService {

    func uploadGallery(galleryData: Gallery ,completion: @escaping (Error?)->()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let gallery = storage.child("Gallery/\(Auth.auth().currentUser!.uid)/\(galleryData.name)/")
        
        for i in 0..<galleryData.imageSelected.count {
            gallery.child("picture\(i)").putData(galleryData.imageSelected[i].image.jpegData(compressionQuality: 0.42)!, metadata: metadata) { (_, error) in
            if error != nil {
                completion(error)
                return
            }
            }

            completion(nil)
        }
    }

    func getGalleries(handler: @escaping (StorageListResult, Error?) -> Void) {
        storage.child("Gallery/").listAll(completion: handler)
    }
}
