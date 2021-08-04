//
//  Indicator.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 26/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct Indicator: UIViewRepresentable {

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
