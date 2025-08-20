//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Josileudo on 09/08/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    var successAuth: (() -> Void)?
    
    func doAuth(usernameAuth: String, passwordAuth: String) {
        print(usernameAuth, passwordAuth)
    
        Auth.auth().signIn(withEmail: usernameAuth, password: passwordAuth) { [weak self] authResult, error in
            if let errorResult = error {
                print("Erro de autenticação \(errorResult)")
            } else {
                self?.successAuth?()                
                print(authResult ?? "", "Autenticação feita com sucesso!!")
            }
        }
    }
}
