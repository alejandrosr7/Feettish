//
//  User.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation

class UserAuthentication: ObservableObject, Identifiable {

    var uid: String
    var email: String
    var password: String = ""
    var isProvider: Int

    init(uid: String, email: String, isProvider: Int) {
        self.uid = uid
        self.email = email
        self.isProvider = isProvider
    }
}
