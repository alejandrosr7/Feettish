//
//  Provider.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 16/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation

struct User {
    var user: UserAuthentication = UserAuthentication(uid: "", email: "", isProvider: 0)
    var firstName: String = ""
    var lastName: String = ""
    var phone: String = ""
}
