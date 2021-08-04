//
//  Image.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 22/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation
import SwiftUI
import Photos

struct Images: Hashable {
    var image: UIImage
    var selected: Bool
    var asset: PHAsset
}
