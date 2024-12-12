//
//  MainThread+Weak.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//

import Foundation

protocol MainThreadRunner: AnyObject {
    func runOnMain(_ block: @escaping () -> Void)
    
    /// Handle view deallocation
    func runOnMainSafety(_ block: @escaping () -> Void)
}


extension MainThreadRunner {
    func runOnMain(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                block()
            }
            return
        }
        block()
    }
    
    func runOnMainSafety(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                [weak self] in
                guard let self = self else { return }
                block()
            }
            return
        }
        
        block()
    }
}

