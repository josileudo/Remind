//
//  LoginBottomSheetScreen.swift
//  Reminder
//
//  Created by Josileudo on 24/02/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    let loginViewModel = LoginBottomSheetViewModel()
    let contentView: LoginBottomSheetView
    let heightAnchor: CGFloat = 50.0
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.delegate = self
           
        setupUI()
        setupGesture()
        bindSuccessAuth()
        
    }

    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }


    private func setupGesture() {

    }
    
    private func bindSuccessAuth() {
        loginViewModel.successAuth = {[weak self] usernameAuth in
            self?.presentSaveLoginAuth(email: usernameAuth)
        }
        
        loginViewModel.errorAuth = {[weak self] errorMessage in
            self?.presentErrorLoginAuth(message: errorMessage)
        }
    }
    
    private func presentErrorLoginAuth(message: String) {
        let alertController = UIAlertController(title: "Error ao logar",
                                                message: message,
                                                preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .default)
        
        alertController.addAction(retryAction)
        
        self.present(alertController, animated: true)
    }
    
    private func presentSaveLoginAuth(email: String) {
        let alertController = UIAlertController(title: "Salvar acesso",
                                                message: "Deseja salvar seu login?",
                                                preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar",
                                       style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveLogin(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não",
                                         style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    private func handlePanGesture() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) {_ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLogin(username: String, password: String) {
        loginViewModel.doAuth(usernameAuth: username, passwordAuth: password)
    }
}
