//
//  MovieDetailsVCVM.swift
//  MovieListTest
//
//  Created by Macbook on 03/12/22.
//

import Foundation

class MovieDetailsVCVM: MovieListTVCPVM {
    
    var movieOriginalTitle: String
    var movieVoteCount: Int
    var isFavourite: Bool
    var movieImageUrl: String
    var movieTitle: String
    var movieDescription: String
    var movieReleaseDate: String
    var moviePopularity: Float
    
    init(imageUrl: String, title: String, description: String, releaseDate: String, popularity: Float, isFav: Bool, originalTitle: String, voteCount: Int) {
        movieImageUrl = Constant.imageBaseUrl + imageUrl
        movieTitle = title
        movieDescription = description
        movieReleaseDate = releaseDate
        moviePopularity = popularity
        isFavourite = isFav
        movieOriginalTitle = originalTitle
        movieVoteCount = voteCount
    }
    
}
