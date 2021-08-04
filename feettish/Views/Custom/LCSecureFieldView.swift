//
//  LCSecureFieldView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 16/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct LCSecureFieldView: View {
    @Binding var value: String
    @State private var showPassword = false
    var placeholder = "Text"
    var body: some View {
        HStack(spacing: 0) {
            if showPassword {
                TextField(placeholder, text: self.$value)
            } else {
                SecureField(placeholder, text: self.$value)
            }

            Spacer()

            Button(action: {
                self.showPassword.toggle()
            }) {
                Image(systemName: showPassword ? Constants.eyeIcon : Constants.eyeSlashIcon).foregroundColor(Color("redColor"))
            }
        }.padding()
    }
}

struct LCSecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LCSecureFieldView(value: .constant("")).previewLayout(.sizeThatFits)
    }
}
