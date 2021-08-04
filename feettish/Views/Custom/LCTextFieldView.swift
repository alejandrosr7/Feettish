//
//  LCTextFieldView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct LCTextFieldView: View {

    @Binding var value: String
    var placeholder = "Placeholder"
    var icon: Image? = Image(systemName: "person.crop.circle")
    var color = Color("offColor")
    @State var isSecure = true

    var body: some View {
        HStack(spacing: 0) {
            icon.imageScale(.large)
                .padding(.leading)
            .foregroundColor(color)

            ZStack(alignment: .leading) {
                
                if value.isEmpty {
                    Text(placeholder).padding(.leading)
                        .foregroundColor(.white)
                }

                if isSecure {
                    LCSecureFieldView(value: self.$value)
                } else {
                    TextField("", text: self.$value)
                        .padding()
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                }
            }
        }.background(color.opacity(0.2))
    }
}

struct LCTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LCTextFieldView(value: .constant("")).previewLayout(.fixed(width: 400, height: 80))
    }
}
