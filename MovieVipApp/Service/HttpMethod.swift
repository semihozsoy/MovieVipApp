//
//  HttpMethod.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 5.08.2021.
//

import Foundation
import Alamofire


public typealias HTTPMethod = Alamofire.HTTPMethod

public extension Endpoint {
    var encoding:ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}


