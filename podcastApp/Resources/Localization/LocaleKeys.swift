//
//  LocaleKeys.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import Foundation

protocol Localizable: RawRepresentable where RawValue == String{
    var localized: String { get }
    func localized (with args: CVarArg...) -> String
}

enum LocaleKeys: String, Localizable {
    case appName = "common_app_name"
    
    enum Onboarding: String, Localizable {
        case title = "common_app_name"
        case subtitle = "onboard_title"
        case buttonTitle = "onboard_button_title"
    }
}

extension Localizable{
    var localized: String{
        return NSLocalizedString(rawValue, comment: "")
    }
    
    func localized(with args: CVarArg...) -> String{
        return String(format: localized, arguments: args)
    }
}
