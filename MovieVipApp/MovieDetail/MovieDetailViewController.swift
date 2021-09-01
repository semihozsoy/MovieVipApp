//
//  MovieDetailViewController.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit
import SDWebImage

protocol MovieDetailDisplayLogic: AnyObject {
    func displayedFetchMovieDetails(viewModel:MovieDetail.FetchMoviesDetail.ViewModel)
}

final class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieDetailImage: UIImageView!
    @IBOutlet weak var movieDetailNameLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetResponseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var overviewResponseLabel: UILabel!
    @IBOutlet weak var genreMovieCollectionView: UICollectionView!
    
    var interactor: MovieDetailBusinessLogic?
    var router: (MovieDetailRoutingLogic & MovieDetailDataPassing)?
    var displayMovieDetail:MovieDetail.FetchMoviesDetail.ViewModel.DisplayedMovieDetails?
    var genres: [String]? = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreMovieCollectionView.delegate = self
        genreMovieCollectionView.dataSource = self
        genreMovieCollectionView.isHidden = false
        genreMovieCollectionView.register(cellType: MovieDetailCollectionViewCell.self)
        interactor?.fetchMovieDetails(request: MovieDetail.FetchMoviesDetail.Request())
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MovieDetailInteractor(worker: MovieDetailWorker())
        let presenter = MovieDetailPresenter()
        let router = MovieDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension MovieDetailViewController: MovieDetailDisplayLogic {

    func displayedFetchMovieDetails(viewModel: MovieDetail.FetchMoviesDetail.ViewModel) {
        displayMovieDetail = viewModel.displayedMovieDetails
        genres = viewModel.displayedMovieDetails.genres
        genreMovieCollectionView.reloadData() // datayı neden reload ettik ? Genres ilk başta boş, 69.satırda genres doluyor collectionview delegate ve datasource'unu tekrar tetiklememiz gerekiyor ki dolu genres alsın.
        budgetResponseLabel.text = String(viewModel.displayedMovieDetails.budget)
        overviewResponseLabel.text = viewModel.displayedMovieDetails.overview
        movieDetailNameLabel.text = viewModel.displayedMovieDetails.movieName
        movieDetailImage.sd_setImage(with: URL(string: "\(Constant.imageBaseUrl)\(viewModel.displayedMovieDetails.movieDetailsImage)"), completed: nil)
    }
}

extension MovieDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genreMovieCollectionView.dequeCell(cellType: MovieDetailCollectionViewCell.self, indexPath: indexPath)
        cell.configureCell(with: genres?[indexPath.item] ?? "")
        cell.layer.transform = cell.transform3D
        return cell 
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }

}
//collectionview indicator kapat, siyah background düzelt, collectionview cell cornerradius verelim, textleri düzeltelim,collection view cell size düzelt
