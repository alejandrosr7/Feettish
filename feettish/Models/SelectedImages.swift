//
//  SelectedImages.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 26/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation
import SwiftUI
import Photos

struct SelectedImages: Hashable{
    
    var asset : PHAsset
    var image : UIImage
    var urlImage: String
}
