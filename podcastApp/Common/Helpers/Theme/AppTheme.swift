//
//  AppTheme.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import Foundation

protocol AppTheme {
    var colorTheme: ThemeColor { get }
    var fontTheme: ThemeFont { get }
    var textFieldTheme: TextFieldTheme { get }
    var buttonTheme: ButtonTheme { get }
}

struct LightTheme: AppTheme {
    let fontTheme: ThemeFont = .defaultTheme
    let colorTheme: ThemeColor = .defaultTheme
    let textFieldTheme: TextFieldTheme = .defaultTheme
    let buttonTheme: ButtonTheme = .defaultTheme
}
