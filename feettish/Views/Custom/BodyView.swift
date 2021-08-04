//
//  BodyView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 8/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct BodyView: View {

    @ObservedObject var value: ViewModel

    var body: some View {
        VStack {
            
            viewSelection(view: "SignIn")
            Spacer()
        }
    }

    func viewSelection(view: String) -> some View {
        switch view {
        case Constants.QuestionnaireView.signIn.rawValue:
            return AnyView( VStack {
                LCTextFieldView(value: $value.provider.user.email, placeholder: Constants.email, icon: Image(systemName: Constants.emailIcon), color: Color("redColor"), isSecure: false)
                
                LCTextFieldView(value: $value.provider.user.password, placeholder: Constants.password, icon: Image(systemName: Constants.passwordIcon), color: Color("redColor"), isSecure: true)
            })
        case Constants.QuestionnaireView.signUp.rawValue:
            return AnyView( VStack {
                LCTextFieldView(value: $value.provider.user.email, placeholder: Constants.email, icon: Image(systemName: Constants.emailIcon), color: Color("redColor"), isSecure: false)
                LCTextFieldView(value: $value.provider.user.password, placeholder: Constants.password, icon: Image(systemName: Constants.passwordIcon), color: Color("redColor"), isSecure: true)
                LCTextFieldView(value: $value.confirmPassword, placeholder: Constants.confirmPassword, icon: Image(systemName: Constants.confirmPasswordIcon), color: Color("redColor"), isSecure: true)
            })
        case Constants.QuestionnaireView.recover.rawValue:
            return AnyView(
                LCTextFieldView(value: $value.provider.user.email, placeholder: Constants.email, icon: Image(systemName: Constants.emailIcon), color: Color("redColor"), isSecure: false)
            )
        case Constants.QuestionnaireView.providerSignUp.rawValue:
            return AnyView( VStack {
                LCTextFieldView(value: $value.provider.firstName, placeholder: Constants.firstName, icon: Image(systemName: Constants.firstNameIcon), color: Color("redColor"), isSecure: false)

                LCTextFieldView(value: $value.provider.lastName, placeholder: Constants.lastName, icon: Image(systemName: Constants.lastNameIcon), color: Color("redColor"), isSecure: false)

                LCTextFieldView(value: $value.provider.phone, placeholder: Constants.phoneNumber, icon: Image(systemName: Constants.phoneIcon), color: Color("redColor"), isSecure: false)

                LCTextFieldView(value: $value.provider.user.email, placeholder: Constants.email, icon: Image(systemName: Constants.emailIcon), color: Color("redColor"), isSecure: false)

                LCTextFieldView(value: $value.provider.user.password, placeholder: Constants.password, icon: Image(systemName: Constants.passwordIcon), color: Color("redColor"), isSecure: true)

                LCTextFieldView(value: $value.confirmPassword, placeholder: Constants.confirmPassword, icon: Image(systemName: Constants.confirmPasswordIcon), color: Color("redColor"), isSecure: true)
            })
        default:
            return AnyView(Text("Hola"))
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(value: ViewModel())
    }
}
