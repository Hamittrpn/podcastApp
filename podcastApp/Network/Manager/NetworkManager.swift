//
//  NetworkManager.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import Foundation
import Alamofire

final class NetworkManager : NetworkManagerProtocol{
    private let config: NetworkConfig
    private let decoder : JSONDecoder
    
    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()) {
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    /// Send your request
    /// - Parameters:
    ///   - path: Network Path
    ///   - method: Http Method
    ///   - type: Generic Encodable Type
    ///   - body: Nullable or Encodable
    ///   - parameter: Query Parameters
    /// - Returns: Result with success response or error
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        parameter: Parameters? = nil
    ) async -> Result<T?, Error>{
        let url = config.baseUrl + path.value
        let request : DataRequest
        
        //TODO: Seperate client object
        if let body = body {
            request = AF.request(
                url,
                method: method.alamofireMethod,
                parameters: body,
                encoder: JSONParameterEncoder.default
            )
        } else {
            request = AF.request(
                url,
                method: method.alamofireMethod,
                parameters: parameter,
                headers: HTTPHeaders.default
            )
        }
        
        let response = await request.validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
        
        guard let responseValue = response.value else {
            return .failure(response.error ?? FailureModel.networkError)
        }
    
        return .success(responseValue)
    }
}
