//
//  ButtonPadding.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import UIKit

enum ButtonPadding {
    case small
    case medium
    case large
    
    var paddingAll: NSDirectionalEdgeInsets {
        switch self {
        case .small: return NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        case .medium: return NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        case .large: return NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        }
    }
}
