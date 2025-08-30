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
    private let viewControllersFactory: ViewControllersFactory
        
    // MARK: - Init
    public init() {
        self.viewControllersFactory = ViewControllersFactory()
    }
        
    // MARK: - Start
    func start() -> UINavigationController? {
        let startViewController = viewControllersFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashViewFlowDelegate {
    func navigateToLogin() {
        let loginBottomSheet = viewControllersFactory.makeLoginBottomSheetViewController(flowDelegate: self )
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: true)
            let homeViewController = viewControllersFactory.makeHomeViewController(flowDelegate: self)
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate, HomeFlowDelegate
{
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let homeViewController = viewControllersFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

