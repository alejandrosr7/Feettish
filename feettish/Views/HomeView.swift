//
//  HomeView.swift
//  feettish
//
//  Created by Alejandro Serna Rodriguez on 11/05/20.
//  Copyright © 2020 Alejandro Serna Rodriguez. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @State var savedSession = UserDefaults.standard.value(forKey: Constants.sessionSaved) as? Bool ?? false
    @State var profileSession = UserDefaults.standard.value(forKey: Constants.userProfileSaved) as? Int

    @EnvironmentObject var session: SessionStore

    var body: some View {
        ZStack {
            CustomBackground()

            if session.session != nil {
                if profileSession == 0 {
                    LobbyView()
                } else {
                    ProviderView()
                }
            } else {
                LoginView()
            }
        }
        .animation(.spring())
        .onAppear {
            self.getUser()
            NotificationCenter.default.addObserver(forName: NSNotification.Name(Constants.sessionSaved), object: nil, queue: .main) { (_) in
                let sessionSaved = UserDefaults.standard.value(forKey: Constants.sessionSaved) as? Bool ?? false
                self.savedSession = sessionSaved
                NotificationCenter.default.addObserver(forName: NSNotification.Name(Constants.userProfileSaved), object: nil, queue: .main) { (_) in
                    let userProfileSaved = UserDefaults.standard.value(forKey: Constants.userProfileSaved) as? Int
                    self.profileSession = userProfileSaved
                }
            }
        }
    }

    func getUser() {
        session.linsten()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(SessionStore())
    }
}
