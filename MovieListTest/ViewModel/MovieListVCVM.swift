//
//  MovieListVCVM.swift
//  MovieListTest
//
//  Created by Macbook on 02/12/22.
//

import Foundation

class MovieListVCVM{
    
    var movieDataArr: [Results]?
    var delegate: MovieListProtocol?
    var pageOffset = 1
    var totalPages = 0
    var isApiCalledAfterPagination = false
    
    init() {}
    
    func callApiGetMovieData(netwrkManager:NetworkManager, apiUrlString:String){
        isApiCalledAfterPagination = true
        let apendedUrl = apiUrlString + "\(pageOffset)"
        let movieUrl = URL(string: apendedUrl)!
        netwrkManager.getApiData(requestUrl: movieUrl, resultType: MovieDataModel.self) {[weak self] result in
            if result?.results.isEmpty == false{
                self?.movieDataArr = result?.results
                self?.totalPages = result?.total_pages ?? 0
                self?.delegate?.refreshTableView()
            }
        }
    }
    
    func updateFavouriteMovie(name: String, isSelected: Bool){
        movieDataArr?.filter({$0.movieTitle == name}).first?.isFavourite = isSelected
        delegate?.refreshTableView()
    }
}
