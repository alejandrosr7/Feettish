//
//  GalleryCell.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 9/06/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct GalleryCell: View {
    var body: some View {
        Image(Constants.logo)
            .resizable()
    }
}

struct GalleryCell_Previews: PreviewProvider {
    static var previews: some View {
        GalleryCell().previewLayout(.sizeThatFits)
    }
}
