//
//  MovieModels.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit



enum Movie {
    
    enum FetchMovies {
        
        struct Request {
            var page: String?
            var imageUrl: String? //viewControllerdan interactordan geçirecegimiz datalar olabilir.
        }
        
        struct Response {
            var movies:[Movies]? // istek atılınca response dönüyor bunu presentera gönderiyoruz ona hazırlıyoruz. Parametre de gönderebiliriz
        }
        
        struct ViewModel {
            struct DisplayedMovie {
                var movieName: String
                var releaseDate: String
                var voteAverage: Double
                var movieImage: String
            }
       
            var displayedMovie: [DisplayedMovie]
        }
        
    }
    enum FilterMovies {
        struct Request {
            let searchText: String?
        }
    }
    //singleton array kaydetme, user defaultsa array kaydetme 
}
// swiftlint:enable nesting
