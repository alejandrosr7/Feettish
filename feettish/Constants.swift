//
//  Constants.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 5/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation

class Constants {
    // MARK: - Labels
    static let appName = "Feettish"
    static let signUpLabel = "Sign Up"
    static let recoverPassword = "Recover Password"
    static let profileImage = "Pick a Profile Image"

    // MARK: - Textfield Placeholders

    static let firstName = "First Name"
    static let lastName = "Last Name"
    static let phoneNumber = "Phone Number"
    static let userName = "User Name"
    static let password = "Password"
    static let email = "Email Address"
    static let confirmPassword = "Confirm Password"
    static let galleryDescription = "Gallery Description"
    static let galleryName = "Gallery Name"

    // MARK: - Buttons Texts
    static let signIn = "Sign In"
    static let signOut = "Sign Out"
    static let signUp = "Don't have an account? Sign up."
    static let forgotPassword = "Forgot your password?"
    static let resetPassword = "Reset Password"
    static let alreadyHaveAccount = "Already have an account?"
    static let cancel = "Cancel"
    static let ok = "Ok"
    static let provider = "Provider"
    static let feettisher = "User"
    static let addImages = "Add Images"
    static let uploadGallery = "Upload Gallery"
    static let imagesSelected = "Select"

    // MARK: - Images
    static let logo = "Logo"

    // MARK: - Icons
    static let emailIcon = "at"
    static let passwordIcon = "lock"
    static let confirmPasswordIcon = "lock.rotation"
    static let eyeIcon = "eye"
    static let eyeSlashIcon = "eye.slash"
    static let firstNameIcon = "person"
    static let lastNameIcon = "person.fill"
    static let phoneIcon = "phone"
    static let paperclipIcon = "paperclip"

    // Mark: - Alert Messages
    static let alert = "Alert"
    static let userPassWrong = "User name or Password are wrong."
    static let passConfirmWrong = "Password and confirm password must be equal."
    static let successUpload = "Gallery created successfully"
    static let galleryUploadErrorMessage = "You must fill all the and select some pictures"

    enum QuestionnaireView: String {
        case signIn = "SignIn"
        case signUp = "SignUp"
        case recover = "Recover"
        case providerSignUp = "provider"
    }

    // Mark: - UserDefaults
    static let sessionSaved = "sessionSaved"
    static let userProfileSaved = "userProfileSaved"

    // Mark: - Color name
    static let redColor = "redColor"
}
