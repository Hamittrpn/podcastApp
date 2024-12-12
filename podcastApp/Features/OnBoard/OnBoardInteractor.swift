//
//  OnBoardInteractor.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//  
//

import Foundation

final class OnBoardInteractor: PresenterToInteractorOnBoardProtocol {
    func saveFirstLaunch() -> Bool {
        /// TODO: Cache it this data
        
        return true
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterOnBoardProtocol?
}
