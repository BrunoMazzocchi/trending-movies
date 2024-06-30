//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 27/6/24.
//

import Foundation

class MainViewModel {
    
    var dataSource: TrendingMoviesModel?
    var isLoadingData: Observable<Bool> = Observable(false)
    var movies: Observable<[Movie]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapMovieData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapMovieData() {
        movies.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
