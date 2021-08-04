//
//  Gallery.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 28/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation

struct Gallery: Identifiable {

    var id = UUID()
    var name: String = ""
    var description: String = ""
    var imageSelected: [SelectedImages] = []
}
