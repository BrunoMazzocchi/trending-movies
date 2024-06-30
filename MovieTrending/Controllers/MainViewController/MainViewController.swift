//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 27/6/24.
//

import UIKit

class MainViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var moviesDataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .red
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.moviesDataSource = movies
            self.reloadTableView()
        }
    }
}
