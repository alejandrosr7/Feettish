//
//  Keyboard.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 12/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import Foundation
import SwiftUI

struct Keyboard: ViewModifier {

    @State private var offSet: CGFloat = 0

    func body(content: Content) -> some View {
        content.padding(.bottom, offSet).onAppear {

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let heigth = value.height
                self.offSet = heigth
            }

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                self.offSet = 0
            }
        }
    }
}

extension View {

    func keyboardResponsive() -> ModifiedContent<Self, Keyboard> {
        return modifier(Keyboard())
    }
}
