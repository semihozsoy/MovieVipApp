//
//  MovieDetailPresenter.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation

protocol MovieDetailPresentationLogic: AnyObject {
    func presentMovieDetails(response: MovieDetail.FetchMoviesDetail.Response)
}

final class MovieDetailPresenter: MovieDetailPresentationLogic {
    var displayedMovieDetails:MovieDetail.FetchMoviesDetail.ViewModel.DisplayedMovieDetails!
    weak var viewController: MovieDetailDisplayLogic?
    
    func presentMovieDetails(response: MovieDetail.FetchMoviesDetail.Response) {
        var genres: [String] = []
        response.movieDetail?.genres?.forEach{
            genres.append($0.name ?? "")
        }
        viewController?.displayedFetchMovieDetails(
            viewModel: .init(
                displayedMovieDetails: .init(
                    movieDetailsImage: response.movieDetail?.posterPath ?? "",
                    budget: response.movieDetail?.budget ?? 0,
                    overview: response.movieDetail?.overview ?? "",
                    movieName: response.movieDetail?.title ?? "",
                    genres: genres
                )
            )
        )
    }
        //scrollview scrollview content layout guides ile beraber kullan !
}

