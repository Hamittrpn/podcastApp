//
//  NetworkManagerProtocol.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable?,
        parameter: Parameters?
    )async -> Result<T?, Error>
}


extension NetworkManagerProtocol {
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        parameter: Parameters? = nil
    )async -> Result<T?, Error>
    
    {
        return await send(path: path, method: method, type: type, body: body, parameter: parameter)
    }
}
