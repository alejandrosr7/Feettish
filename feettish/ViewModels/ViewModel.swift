//
//  SignUpViewModel.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 7/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation
import Firebase
import Combine


class ViewModel: ObservableObject {

    @Published var provider = User()
    @Published var confirmPassword = ""
    @Published var alert = false
    @Published var errorMessage = ""
    @Published var shouldShowLobby = false
    @Published var shouldShowLoadContentView = false
    var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
    var onSuccessLogin = PassthroughSubject<Bool, Never>()
    var databaseService = DatabaseService()
    var session = SessionStore()

    private var shouldPopView = false {
        didSet {
            viewDismissalModePublisher.send(shouldPopView)
        }
    }

    func registerSuccess() {

        self.provider.user.email = ""
        self.provider.user.password = ""
        self.confirmPassword = ""

        UserDefaults.standard.set(provider.user.isProvider, forKey: Constants.userProfileSaved)
        NotificationCenter.default.post(name: NSNotification.Name(Constants.userProfileSaved), object: nil)

        self.errorMessage = "Register Success"
        self.alert.toggle()
    }

    func signUpProcess() {
        if provider.user.password != confirmPassword && !provider.user.password.isEmpty && !confirmPassword.isEmpty {
            errorMessage = Constants.passConfirmWrong
            alert.toggle()
        } else {
            signUp()
        }
    }

    func signUp() {
        session.signUp(user: provider) { (_, error) in
            if error != nil {
                self.errorMessage = error!.localizedDescription
                self.alert.toggle()
            } else {
                self.session.saveUserInformation(with: self.provider, userID: Auth.auth().currentUser!.uid)
                self.registerSuccess()
            }
        }
    }

    func signIn() {
        databaseService.signInWebService(provider: provider) { (isProvider, error) in
            if error != nil {
                self.errorMessage = error!.localizedDescription
                self.alert.toggle()
            } else {
                guard let isProvider = isProvider else {
                    return
                }
                self.session.session?.isProvider = isProvider
                UserDefaults.standard.set(isProvider, forKey: Constants.userProfileSaved)
                NotificationCenter.default.post(name: NSNotification.Name(Constants.userProfileSaved), object: nil)
            }
        }
    }

    func recoverPassword() {
        session.recoverPassword(user: provider) { (error) in
            if error != nil {
                self.errorMessage = error!.localizedDescription
                self.alert.toggle()
            }  else {
                self.provider.user.email = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.shouldPopView = true
                }
            }
        }
    }

    func signOut() {
        session.signOut()
    }
}
