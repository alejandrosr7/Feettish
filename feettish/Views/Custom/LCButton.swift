//
//  LCButton.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct LCButton: View {

    var text = "Sign Up"
    var iconName: String? = ""
    var action: (()->()) = {}

    var body: some View {

        Button(action: action) {
            HStack {
                Text(text).bold()
                    .frame(minWidth: 0, maxWidth: .infinity)

                Image(systemName: iconName ?? "")
                    .padding(.trailing)
            }.padding(.vertical)
            .accentColor(Color.white)
            .background(Color("redColor"))
            .cornerRadius(30)
        }
    }
}

struct LCButton_Previews: PreviewProvider {
    static var previews: some View {
        LCButton().previewLayout(.fixed(width: 300, height: 100))
    }
}
