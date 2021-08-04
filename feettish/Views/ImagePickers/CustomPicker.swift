//
//  CustomPicker.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 22/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI
import Photos

struct CustomPicker: View {

    @Binding var selected : [SelectedImages]
    @State private var grid : [[Images]] = []
    @Binding var show : Bool
    @State private var disabled = false

    var body: some View{
        GeometryReader{_ in

            VStack{
                if !self.grid.isEmpty{

                    HStack{

                        Text(Constants.profileImage)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20){
                            ForEach(self.grid,id: \.self){i in
                                HStack{
                                    ForEach(i,id: \.self){j in
                                        Card(data: j, selected: self.$selected)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }

                    Button(action: {
                        self.show.toggle()
                    }) {

                        Text(Constants.imagesSelected)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                    .background(Color.red.opacity((self.selected.count != 0) ? 1 : 0.5))
                    .clipShape(Capsule())
                    .padding(.bottom)
                    .disabled((self.selected.count != 0) ? false : true)
                }
                else{
                    
                    if self.disabled{
                        Text("Enable Storage Access In Settings !!!")
                    }
                    if self.grid.count == 0{
                        
                        Indicator()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
            .background(Color.white)
            .cornerRadius(12)
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.show.toggle()

        })
            .onAppear {

                PHPhotoLibrary.requestAuthorization { (status) in
                    if status == .authorized{
                        self.getAllImages()
                        self.disabled = false
                    }
                    else{
                        print("not authorized")
                        self.disabled = true
                    }
                }
        }
    }

    func getAllImages(){

        let opt = PHFetchOptions()
        opt.includeHiddenAssets = false

        let req = PHAsset.fetchAssets(with: .image, options: .none)

        DispatchQueue.global(qos: .background).async {

            let options = PHImageRequestOptions()
            options.isSynchronous = true

            // New Method For Generating Grid Without Refreshing....

            for i in stride(from: 0, to: req.count, by: 3){

                var iteration : [Images] = []

                for j in i..<i+3{

                    if j < req.count{

                        PHCachingImageManager.default().requestImage(for: req[j], targetSize: CGSize(width: 150, height: 150), contentMode: .default, options: options) { (image, _) in

                            let data1 = Images(image: image!, selected: false, asset: req[j])

                            iteration.append(data1)
                        }
                    }
                }
                self.grid.append(iteration)
            }
        }
    }
}
