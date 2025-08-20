//
//  String+Ext.swift
//  Reminder
//
//  Created by Josileudo on 10/06/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var trim: String {
        return NSLocalizedString(self.trimmingCharacters(in: .whitespaces), comment: "")
    }
}
