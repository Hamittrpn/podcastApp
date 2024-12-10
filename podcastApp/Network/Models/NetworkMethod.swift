 //
//  NetworkMethod.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import Foundation
import Alamofire

enum NetworkMethod {
    case get
    case post
    case put
    case delete
    
    var alamofireMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}
