//
//  SessionStore.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 3/06/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Firebase
import SwiftUI
import Combine

class SessionStore: ObservableObject {

    var didChange = PassthroughSubject<SessionStore, Never>()
    let database = Firestore.firestore()

    @Published var session: UserAuthentication? {
        didSet {
            self.didChange.send(self)
        }
    }

    var handle: AuthStateDidChangeListenerHandle?

    func linsten() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = UserAuthentication(uid: user.uid, email: user.email!, isProvider: self.isProvider())
                UserDefaults.standard.set(self.isProvider(), forKey: Constants.userProfileSaved)
                NotificationCenter.default.post(name: NSNotification.Name(Constants.userProfileSaved), object: nil)
            } else {
                self.session = nil
            }
        }
    }

    func signUp(user: User, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: user.user.email, password: user.user.password, completion: handler)
    }

    func signIn(user: User, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: user.user.email, password: user.user.password, completion: handler)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
            UserDefaults.standard.set(nil, forKey: Constants.userProfileSaved)
            NotificationCenter.default.post(name: NSNotification.Name(Constants.userProfileSaved), object: nil)
        } catch {
            print(error.localizedDescription)
        }
    }

    func recoverPassword(user: User, handler: @escaping SendPasswordResetCallback) {
        Auth.auth().sendPasswordReset(withEmail: user.user.email, completion: handler)
    }

    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    deinit {
        unbind()
    }

    func saveUserInformation(with provider: User, userID: String) {
        let providerDictionary = ["firstName" : provider.firstName, "lastName" : provider.lastName, "phone" : provider.phone, "email" : provider.user.email, "isProvider" : provider.user.isProvider] as [String : Any]

        database.collection(Constants.feettisher).document(userID).setData(providerDictionary)
    }

    func isProvider() -> Int {
        var isProvider = 0
        database.collection(Constants.feettisher).document(Auth.auth().currentUser!.uid).getDocument { (document, error) in
            if let document = document {
                isProvider = (document.data()?["isProvider"] as? Int)!
            }
        }

        return isProvider
    }
}
