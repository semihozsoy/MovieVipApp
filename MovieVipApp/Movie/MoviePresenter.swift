//
//  MoviePresenter.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation

protocol MoviePresentationLogic: AnyObject {
    func presentMovies(response: Movie.FetchMovies.Response)
}

final class MoviePresenter: MoviePresentationLogic {
    
    weak var viewController: MovieDisplayLogic?
    
    func presentMovies(response: Movie.FetchMovies.Response) {
        var displayedMovies :[Movie.FetchMovies.ViewModel.DisplayedMovie] = []
        
        response.movies?.forEach {
            displayedMovies.append(
                Movie.FetchMovies.ViewModel.DisplayedMovie(
                    movieName: $0.title ?? "",
                    releaseDate: $0.releaseDate ?? "",
                    voteAverage: $0.voteAverage ?? 0.0,
                    movieImage: "\(Constant.imageBaseUrl)\($0.posterPath ?? "")"
                )
            )
        }
        
        viewController?.displayFetchedMovies(viewModel: Movie.FetchMovies.ViewModel(displayedMovie: displayedMovies))
        viewController?.prepareSearchController()
    }
    
}
