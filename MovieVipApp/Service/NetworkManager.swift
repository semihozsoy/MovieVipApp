//
//  NetworkManager.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 5.08.2021.
//

import Foundation
import Alamofire

public typealias Completion<T> = (Result<T,Error>)-> Void where T:Decodable


public final class NetworkManager<EndpointItem:Endpoint> {
    
    public init() {}
    
    private var possibleEmptyResponseCodes: Set<Int> {
        var defaultSet = DataResponseSerializer.defaultEmptyResponseCodes
        defaultSet.insert(200)
        defaultSet.insert(201)
        return defaultSet
    }
    
    
    public func request<T:Codable>(endPoint:EndpointItem,type:T.Type,completion: @escaping Completion<T>){
        AF.request(endPoint.url, method: endPoint.method, parameters: endPoint.parameters , encoding: endPoint.encoding, headers: HTTPHeaders(endPoint.headers))
            .validate()
            .response(responseSerializer:DataResponseSerializer(emptyResponseCodes: possibleEmptyResponseCodes),completionHandler: { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedObject = try JSONDecoder().decode(type, from: data)
                        completion(.success(decodedObject))
                    } catch  {
                        let decodingError = APIClientError.decoding(error: error as? DecodingError)
                        completion(.failure(decodingError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
}
