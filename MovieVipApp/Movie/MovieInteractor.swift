//
//  MovieInteractor.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit

protocol MovieBusinessLogic: AnyObject {
    func fetchMovies(request:Movie.FetchMovies.Request)
    func filterList(request: Movie.FilterMovies.Request)
}

protocol MovieDataStore: AnyObject {
    var filtredList: [Movies] {get}
}

final class MovieInteractor: MovieBusinessLogic, MovieDataStore {
    
    var filtredList: [Movies] = []
    var movies: [Movies]?
    var presenter: MoviePresentationLogic?
    var worker: MovieWorkingLogic?
    
    init(worker: MovieWorkingLogic) {
        self.worker = worker
    }

    func fetchMovies(request: Movie.FetchMovies.Request) {

        worker?.fetchMovies(completion: { [weak self] results in
            switch results {
            case let .success(response):
                self?.movies = response.results // movieler geldiginde interactorda tutmak icin
                self?.filtredList = response.results ?? []
                self?.presenter?.presentMovies(response: .init(movies: self?.filtredList))
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
      
    }
    
    func filterList(request: Movie.FilterMovies.Request) {
        if (request.searchText?.count ?? 0) > 2 {
            filtredList = movies?.filter({ (movie:Movies)-> Bool in
                
                return movie.title?.lowercased().contains(request.searchText?.lowercased() ?? "") ?? false
               
            }) ?? []
        }else {
            filtredList = self.movies ?? []
        }
        self.presenter?.presentMovies(response: .init(movies: filtredList))
    }
}

