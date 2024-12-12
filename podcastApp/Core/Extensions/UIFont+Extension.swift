//
//  UIFont+Extension.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import Foundation
import UIKit
 
extension UIFont {
    
    /// Bolder font
    var bolded: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
