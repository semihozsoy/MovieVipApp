//
//  MovieDetailWorker.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit

protocol MovieDetailWorkingLogic: AnyObject {
    func fetch(id:Int,completion: @escaping ((Result<MoviesDetail,Error>)->Void))
}

final class MovieDetailWorker: MovieDetailWorkingLogic {
    
    let networkManager: NetworkManager<MovieEndpointItem> = NetworkManager()
    
    func fetch(id:Int,completion: @escaping ((Result<MoviesDetail, Error>) -> Void)) {
        networkManager.request(endPoint: .movieDetails(id: id), type: MoviesDetail.self, completion: completion)
    }
    
    
}
