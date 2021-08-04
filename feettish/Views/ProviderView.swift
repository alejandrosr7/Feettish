//
//  ProviderView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 20/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct ProviderView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var session = SessionStore()
    @State private var shouldShowPictureProfilePicker: Bool = false
    @State private var selected: [UIImage] = []
    @State private var data: [Images] = []
    @State private var image: Image? = Image(Constants.logo)
    
    var body: some View {
        NavigationView {
            ZStack {
                CustomBackground().navigationBarItems(leading: Button(action: {
                    self.session.signOut()
                }, label: {
                    Text(Constants.signOut).foregroundColor(.white)
                }))
                VStack {
                    image?
                        .resizable()
                        .scaledToFit()
                        .frame(height: 320)
                        .clipShape(Circle())

                    LCButton(text: "Profile picture", iconName: "photo") {
                        withAnimation {
                            self.shouldShowPictureProfilePicker.toggle()
                        }
                    }
                    .foregroundColor(.black)

                    NavigationLink (destination: UploadContentView()) {
                        Text("Upload Content").bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .padding()
                    .accentColor(Color.white)
                    .background(Color("redColor"))
                    .cornerRadius(30)
                    Spacer()
                }
            }
            .sheet(isPresented: $shouldShowPictureProfilePicker) {
                ImagePicker(sourceType: .photoLibrary) { (image) in
                    self.image = Image(uiImage: image)
                }
                
            }
        }
    }
}

struct ProviderView_Previews: PreviewProvider {
    static var previews: some View {
        ProviderView()
    }
}
