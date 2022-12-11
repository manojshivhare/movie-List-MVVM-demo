//
//  MovieDataModel.swift
//  MovieListTest
//
//  Created by Macbook on 02/12/22.
//

import Foundation

class MovieDataModel: Decodable {
    let page: Int
    let results:[Results]
    let total_pages:Int
}

class Results: Decodable{
    var originalTitle: String
    var voteCount: Int
    var movieTitle:String
    var movieDescription: String
    var popularity: Float
    var releaseDate: String
    var posterUrl: String
    var isFavourite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case movieTitle = "title", movieDescription = "overview", popularity = "popularity",
        releaseDate = "release_date",posterUrl = "poster_path", originalTitle = "original_title",
        voteCount = "vote_count"
    }
}
