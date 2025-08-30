//
//  LoginBottomSheetViewDelegateViewController.swift
//  Reminder
//
//  Created by Josileudo on 09/08/25.
//

import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLogin(username: String, password: String)
}
