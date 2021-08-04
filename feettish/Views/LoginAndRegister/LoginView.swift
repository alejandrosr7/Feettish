//
//  Login.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 4/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State private var formOffset: CGFloat = 0
    @State private var presentPasswordRecoveryView = false
    @State private var provider = 0
    
    var body: some View {

        NavigationView {
            ZStack {
                CustomBackground()

                VStack {
                    HeaderView(title: Constants.appName)

                    Group {
                        BodyView(value: viewModel).viewSelection(view: self.presentPasswordRecoveryView ? Constants.QuestionnaireView.recover.rawValue : Constants.QuestionnaireView.signIn.rawValue)

                        LCButton(text: self.presentPasswordRecoveryView ? Constants.recoverPassword : Constants.signIn) {
                            if self.presentPasswordRecoveryView {
                                self.viewModel.recoverPassword()
                            } else {
                                self.viewModel.signIn()
                            }
                        }.alert(isPresented: $viewModel.alert) {
                            Alert(title: Text(Constants.alert), message: Text(viewModel.errorMessage), dismissButton: .default(Text(Constants.ok)))
                        }.keyboardResponsive()

                        if !self.presentPasswordRecoveryView {
                            NavigationLink(destination: SignUpView()) {
                                Text(Constants.signUp).foregroundColor(.white)
                            }.padding(.top)
                        }

                        Button(action: {
                            withAnimation {
                                self.presentPasswordRecoveryView.toggle()
                            }
                        }) {
                            Text(self.presentPasswordRecoveryView ? Constants.cancel : Constants.forgotPassword).foregroundColor(.white)
                        }.padding(.top)
                    }
                    
                }.edgesIgnoringSafeArea(.top)
                    .padding()
                    .offset(y: self.formOffset)

                Spacer()
            }
        }
        .accentColor(.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
            LoginView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
