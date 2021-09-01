//
//  MovieEndpointItem.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 5.08.2021.
//

import Foundation
import Alamofire

enum MovieEndpointItem:Endpoint {
    
    case movie(query:String)
    case movieDetails(id:Int)
    case movieImage(path:String)
    case search(query:String)
    
    var baseUrl: String {"https://api.themoviedb.org/3/movie/"}
    
    var searchUrl: String {"https://api.themoviedb.org/3/search/movie?api_key=36208b8e44a20dcb221c274d4cc78c10&language=en-US&query="}
    
    var path: String{
        switch self {
        case .movie(let query):
            return "top_rated?api_key=36208b8e44a20dcb221c274d4cc78c10&language=en-US&page=1\(query)"
        case .movieDetails(let id):
            return "\(id)?api_key=36208b8e44a20dcb221c274d4cc78c10&language=en-US"
        case .movieImage(let path):
            return "\(path)"
        case .search(let query):
            return "\(query)"
        }
    }

    var method: HTTPMethod{
        switch self {
        case .movie:
            return .get
        case .movieDetails:
            return .get
        case .movieImage:
            return .get
        case .search:
            return .get
        }
    }
}

struct Constant  {
    static var imageBaseUrl: String {"https://image.tmdb.org/t/p/w500/"}
}
