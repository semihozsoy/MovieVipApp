//
//  Endpoint.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation
import Alamofire

public protocol Endpoint {
    var baseUrl:String {get}
    var searchUrl: String {get}
    var method: HTTPMethod {get}
    var parameters: [String:Any] {get}
    var headers: [String:String] {get}
    var path: String {get}
}

public extension Endpoint {
    var headers:[String:String] {[:]}
    var parameters: [String:Any] {[:]}
    var url: String {"\(baseUrl)\(path)"}
    var searchUrl: String {"\(path)"}
}


