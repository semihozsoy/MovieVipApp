//
//  MovieDetailInteractor.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation

protocol MovieDetailBusinessLogic: AnyObject {
    func fetchMovieDetails(request:MovieDetail.FetchMoviesDetail.Request)
}

protocol MovieDetailDataStore: AnyObject {
    var selectedMovieId: Int? {get set} //burda tutulan değeri routerda kullanıyoruz veya başka ekrana geçiş de kullanılabilir 
}

final class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {
    var selectedMovieId: Int?
    var moviesDetail: MoviesDetail?

    
    var presenter: MovieDetailPresentationLogic?
    var worker: MovieDetailWorkingLogic?
    
    init(worker: MovieDetailWorkingLogic) {
        self.worker = worker
    }
    
    func fetchMovieDetails(request: MovieDetail.FetchMoviesDetail.Request) {
        worker?.fetch(id: selectedMovieId ?? 0, completion: { [weak self] results in
            switch results {
            case .success(let response):
                self?.moviesDetail = response
                self?.presenter?.presentMovieDetails(response: .init(movieDetail: self?.moviesDetail))
            case let .failure(error):
                print(error.localizedDescription)
            }
        })
    }
}
