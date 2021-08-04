//
//  HeaderView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct HeaderView: View {

    var title = Constants.appName

    var body: some View {
        GeometryReader { gr in
            VStack {
                Image(Constants.logo)
                    .resizable()
                    .clipShape(Circle())
                    .background(Circle()
                        .foregroundColor(Color(.white)))
                    .frame(width: gr.size.width / 2, height: gr.size.width / 2)
                    .shadow(radius: 10)

                Text(self.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                    .frame(width: gr.size.width)
                    .foregroundColor(Color("redColor"))
                Spacer()
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().previewLayout(.sizeThatFits)
    }
}
