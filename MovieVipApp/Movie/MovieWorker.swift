//
//  MovieWorker.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit

protocol MovieWorkingLogic: AnyObject {
    func fetchMovies(completion: @escaping ((Result<Welcome,Error>) -> Void) )
}

final class MovieWorker: MovieWorkingLogic {
 
    let networkManager: NetworkManager<MovieEndpointItem> = NetworkManager()

    func fetchMovies(completion: @escaping ((Result<Welcome, Error>) -> Void)) {
        networkManager.request(endPoint: .movie(query: ""), type: Welcome.self, completion: completion)
    }
  
}
