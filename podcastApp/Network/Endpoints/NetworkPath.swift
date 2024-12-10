//
//  NetworkPath.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import Foundation

enum NetworkPath: String, NetworkPathProtocol {
    case login = "/login"
    var value: String {
         self.rawValue
    }
}

protocol NetworkPathProtocol {
    var value: String { get }
}
