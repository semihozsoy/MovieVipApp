//
//  MovieDetailRouter.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import Foundation

protocol MovieDetailRoutingLogic: AnyObject {
    
}

protocol MovieDetailDataPassing: AnyObject {
    var dataStore: MovieDetailDataStore? { get } // DataStoreda ne tutulmus ise buna biz erismemizi sağlıyor.
}

final class MovieDetailRouter: MovieDetailRoutingLogic, MovieDetailDataPassing {
    
    weak var viewController: MovieDetailViewController?
    var dataStore: MovieDetailDataStore?
    
}
