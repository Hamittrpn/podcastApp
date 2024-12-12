//
//  OnBoardViewController.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//  
//

import UIKit

final class OnBoardViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterOnBoardProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let onBoardView = OnBoardView(self)
        onBoardView.presenter = presenter
        view = onBoardView
    }
     
}

extension OnBoardViewController: PresenterToViewOnBoardProtocol{
    // TODO: Implement View Output Methods
}

#Preview {
    OnBoardRouter.createModule()
}
