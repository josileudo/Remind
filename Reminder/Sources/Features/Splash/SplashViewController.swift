//
//  SplashViewController.swift
//  Reminder
//
//  Created by Josileudo on 28/12/24.
//
import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView = SplashView()
    private weak var flowDelegate: SplashViewFlowDelegate?
    
    init(flowDelegate: SplashViewFlowDelegate) {
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryRedBase
        self.navigationController?.navigationBar.isHidden = true
        
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]) // Podemos configurar um a um, o uso do array é para evitar repetição
        
        contentView.translatesAutoresizingMaskIntoConstraints = false // sempre deve ser false
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        self.flowDelegate?.navigateToLogin()
    }
}
