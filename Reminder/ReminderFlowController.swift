//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Josileudo on 19/08/25.
//
import Foundation
import UIKit

class ReminderFlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    // MARK: - Login
        
    // MARK: - Init
    public init() {
        
    }
        
    // MARK: - Start
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashViewFlowDelegate {
    func navigateToLogin() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        
        self.navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}

// MARK: - Home
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateGoToHome() {
        self.navigationController?.dismiss(animated: true)
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

