//
//  UploadContentView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 22/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI
import Firebase

struct UploadContentView: View {

    @State private var galleryName: String = ""
    @State private var galleryDescription: String = ""
    @State private var shouldShowPicker: Bool = false
    @ObservedObject var providerViewModel = ProviderViewModel()

    var body: some View{

            ZStack{
                CustomBackground()
                Color.black.opacity(0.07).edgesIgnoringSafeArea(.all)

                VStack{
                    if !providerViewModel.gallery.imageSelected.isEmpty {

                        ScrollView(.horizontal, showsIndicators: false) {

                            HStack(spacing: 20){

                                ForEach(self.providerViewModel.gallery.imageSelected,id: \.self){i in
                                    
                                    Image(uiImage: i.image)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                    .cornerRadius(15)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }

                    LCButton(text: Constants.addImages, iconName: Constants.paperclipIcon) {
                        self.providerViewModel.gallery.imageSelected.removeAll()

                        self.shouldShowPicker.toggle()
                    }

                    LCTextFieldView(value: self.$providerViewModel.gallery.name, placeholder: Constants.galleryName, icon: nil, color: Color("redColor"), isSecure: false)

                    LCTextFieldView(value: self.$providerViewModel.gallery.description, placeholder: Constants.galleryDescription, icon: nil, color: Color("redColor"), isSecure: false)

                    Spacer()

                    LCButton(text: Constants.uploadGallery) {
                        self.providerViewModel.uploadGallery()
                    }
                    
                    Spacer()
                }

                if self.shouldShowPicker{
                    CustomPicker(selected: self.$providerViewModel.gallery.imageSelected, show: self.$shouldShowPicker)
                }
            }.alert(isPresented: self.$providerViewModel.shoulShowMessage) {
                Alert(title: Text(Constants.alert), message: Text(self.providerViewModel.errorMessage), dismissButton: .default(Text(Constants.ok)))
        }
        }
}

struct UploadContentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadContentView()
    }
}
