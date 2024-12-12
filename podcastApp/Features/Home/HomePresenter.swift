//
//  HomePresenter.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//  
//

import Foundation

final class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    private weak var view: PresenterToViewHomeProtocol?
    private let interactor: PresenterToInteractorHomeProtocol
    private let router: PresenterToRouterHomeProtocol

    init(interactor: PresenterToInteractorHomeProtocol, router: PresenterToRouterHomeProtocol, view: PresenterToViewHomeProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
}
