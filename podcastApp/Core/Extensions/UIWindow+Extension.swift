//
//  UIWindow+Extension.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import UIKit

extension UIWindow {
    
    /// Get current window
    static var current: UIWindow? {
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first { $0.isKeyWindow }
    }
}
