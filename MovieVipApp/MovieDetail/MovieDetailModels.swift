//
//  MovieDetailModels.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation

// swiftlint:disable nesting
enum MovieDetail {
    
    enum FetchMoviesDetail {
        
        struct Request {
            var id: Int?
        }
        
        struct Response {
            var movieDetail:MoviesDetail?
        }
        
        struct ViewModel {
            struct DisplayedMovieDetails {
                var movieDetailsImage: String
                var budget: Int
                var overview: String
                var movieName: String
                var genres:[String]
            }
            var displayedMovieDetails: DisplayedMovieDetails
            
        }
      
    }
    
}
// swiftlint:enable nesting
