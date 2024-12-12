//
//  BaseView.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView, MainThreadRunner {
    var controller: T

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        backgroundColor = appTheme.colorTheme.primaryColor
        setupView()
    }
    
     var appTheme: AppTheme {
         ThemeManager.defaultTheme
    }
    
    static var currentTheme: AppTheme {
        return ThemeManager.defaultTheme
    }

    func setupView() { }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
