//
//  SplashViewController.swift
//  Reminder
//
//  Created by Josileudo on 28/12/24.
//
import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    private weak var flowDelegate: SplashViewFlowDelegate?
    
    init(contentView: SplashView, flowDelegate: SplashViewFlowDelegate) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBreathingAnimation()
        setup()
    }
    
    private func decideNavigateFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            flowDelegate?.navigateToHome()
        } else {
            showLoginBottomSheet()
        }
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryRedBase
        self.navigationController?.navigationBar.isHidden = true
        
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
         setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        startLogoUp()
        self.flowDelegate?.navigateToLogin()
    }
}

// MARK: Animations
extension SplashViewController {
    func startBreathingAnimation() {
        UIView.animate(
            withDuration: 1.5,
            delay: 0.0,
            animations: {
                self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.decideNavigateFlow()
        })
    }
    
    func startLogoUp() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -150)
            })
    }
}
