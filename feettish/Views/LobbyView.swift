//
//  LobbyView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 6/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct LobbyView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var providerViewModel = ProviderViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                CustomBackground()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        
                        Button(action: {
                            self.viewModel.signOut()
                        }) {
                            Text(Constants.signOut)
                        }.alert(isPresented: $viewModel.alert) { () -> Alert in
                            Alert(title: Text(Constants.alert), message: Text(viewModel.errorMessage), dismissButton: .default(Text(Constants.ok)))
                        }
    //                    ForEach(providerViewModel.gallery.imageSelected, id: \.self) { i in
    //                        HStack(spacing: 30) {
    //                            ForEach(i) { j in
    //                                print(j)
    //                            }
    //                        }
    //                    }
                    }
                }
            }
        }.onAppear {
            self.providerViewModel.getGalleries()
        }
    }
}

struct LobbyView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView()
    }
}
