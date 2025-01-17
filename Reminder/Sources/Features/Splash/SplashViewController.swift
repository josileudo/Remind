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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        option()
    }
    
    private func option() {
        self.view.addSubview(contentView)
        
        setupConstraints()
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
}
