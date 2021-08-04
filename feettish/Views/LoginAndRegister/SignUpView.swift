//
//  SignUpView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            CustomBackground()

                VStack {
                    HeaderView(title: Constants.signUpLabel)
                    .padding(.vertical)
                    TwoStatesButton(provider: $viewModel.provider.user.isProvider, buttonOne: Constants.feettisher, buttonTwo: Constants.provider)

                    ScrollView {

                    Divider()

                    BodyView(value: viewModel).viewSelection(view: self.viewModel.provider.user.isProvider == 0 ? Constants.QuestionnaireView.signUp.rawValue : Constants.QuestionnaireView.providerSignUp.rawValue)
                    
                    
                    LCButton(text: Constants.signUpLabel) {
                        self.viewModel.signUpProcess()
                    }.padding()
                        .alert(isPresented: $viewModel.alert) { () -> Alert in
                            Alert(title: Text(Constants.alert), message: Text(viewModel.errorMessage), dismissButton: .default(Text(Constants.ok)))
                    }
                }.padding()
                    .keyboardResponsive()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            SignUpView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            SignUpView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
            SignUpView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
