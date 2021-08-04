//
//  CustomBackground.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 21/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        GeometryReader { gr in
            ZStack {
                Color("darkerColor").edgesIgnoringSafeArea(.all)

                CapsuleView(content: gr, multiWidth: 0.9, multiHeight: 0.5, posX: 300, posY: -100, color: Color(Constants.redColor))
                CapsuleView(content: gr, multiWidth: 0.9, multiHeight: 0.5, posX: -20, posY: 500, color: Color(Constants.redColor))
                CapsuleView(content: gr, multiWidth: 0.9, multiHeight: 0.5, posX: 250, posY: 900, color: Color(Constants.redColor))
            }
        }
    }
}

struct CapsuleView: View {
    var content: GeometryProxy
    var multiWidth: CGFloat
    var multiHeight: CGFloat
    var posX: CGFloat
    var posY: CGFloat
    var color: Color

    var body: some View {
        Capsule()
            .fill(self.color)
            .frame(width:content.size.width * self.multiWidth ,height: content.size.height * self.multiHeight)
            .position(x: posX, y: posY)
    }
}

struct CustomBackground_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomBackground()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            CustomBackground()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
            CustomBackground()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
