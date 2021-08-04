//
//  TwoStatesButton.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 18/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct TwoStatesButton: View {
    
    @Binding var provider: Int
    var buttonOne: String
    var buttonTwo: String
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.provider = 0
                }
            }) {
                Text(buttonOne)
                    .foregroundColor(self.provider == 0 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
            }.background(self.provider == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
            
            Button(action: {
                withAnimation {
                    self.provider = 1
                }
            }) {
                Text(buttonTwo)
                    .foregroundColor(self.provider == 1 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
            }.background(self.provider == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
        }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
    }
}


struct TwoStatesButton_Previews: PreviewProvider {
    static var previews: some View {
        TwoStatesButton(provider: .constant(0), buttonOne: "", buttonTwo: "").previewLayout(.sizeThatFits)
    }
}
