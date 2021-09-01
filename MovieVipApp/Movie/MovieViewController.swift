//
//  MovieViewController.swift
//  MovieVipApp
//
//  Created by Semih Özsoy on 4.08.2021.
//

import UIKit

protocol MovieDisplayLogic: AnyObject {
    func displayFetchedMovies(viewModel:Movie.FetchMovies.ViewModel)
    func prepareSearchController()
}

final class MovieViewController: UIViewController {
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    @IBOutlet weak var movieTableView: UITableView!
    var displayMovies: [Movie.FetchMovies.ViewModel.DisplayedMovie] = []
    var interactor: MovieBusinessLogic?
    var router: (MovieRoutingLogic & MovieDataPassing)?
    
    
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
        let request = Movie.FetchMovies.Request()
        interactor?.fetchMovies(request: request)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(cellType: MovieTableViewCell.self)
        view.backgroundColor = UIColor(hex: "F1ECC3")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MovieInteractor(worker: MovieWorker())
        let presenter = MoviePresenter()
        let router = MovieRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension MovieViewController: MovieDisplayLogic {
    
    func displayFetchedMovies(viewModel: Movie.FetchMovies.ViewModel) {
        displayMovies = viewModel.displayedMovie
        movieTableView.isHidden = false
        movieTableView.reloadData()
        
    }
    func prepareSearchController() {
        movieSearchBar.delegate = self
        movieSearchBar.placeholder = "search"
    }
}

extension MovieViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayMovies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cellType: MovieTableViewCell.self, indexPath: indexPath)
        cell.configureCell(viewModel: displayMovies[indexPath.row])
        cell.configureCellImage(viewModel: displayMovies[indexPath.row])
        let myView = UIView()
        myView.backgroundColor = UIColor(hex: "57837B")
        UITableViewCell.appearance().selectedBackgroundView = myView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToMovieDetail(index: indexPath.row)
    }
    
}

extension MovieViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.filterList(request: .init(searchText: searchText))
    }
    
}
