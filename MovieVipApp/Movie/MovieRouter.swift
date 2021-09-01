//
//  MovieRouter.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit

protocol MovieRoutingLogic: AnyObject {
    func routeToMovieDetail(index:Int)
}

protocol MovieDataPassing: AnyObject {
    var dataStore: MovieDataStore? { get }
}

final class MovieRouter: MovieRoutingLogic, MovieDataPassing {
  
    weak var viewController: MovieViewController?
    var dataStore: MovieDataStore?
    
    func routeToMovieDetail(index:Int) {
        let storyBoard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "movieDetailVC") as! MovieDetailViewController
        destinationVC.router?.dataStore?.selectedMovieId = dataStore?.filtredList[index].id ?? 0
        
        self.viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
}
