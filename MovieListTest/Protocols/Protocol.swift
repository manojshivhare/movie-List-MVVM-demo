//
//  Protocol.swift
//  MovieListTest
//
//  Created by Macbook on 03/12/22.
//

import Foundation
//For Refresh tableView
protocol MovieListProtocol {
    func refreshTableView()
}

//For TVC ViewModel
protocol MovieListTVCPVM:AnyObject {
    var movieImageUrl:String {get set}
    var movieTitle:String {get set}
    var movieDescription:String {get set}
    var movieReleaseDate:String {get set}
    var movieOriginalTitle:String {get set}
    var movieVoteCount:Int {get set}
    var moviePopularity:Float {get set}
    var isFavourite:Bool {get set}
}

//For Sending Favourite Movie Update
protocol MovieDetailsVCProtocol: AnyObject {
    func isFavouriteMovieSelected(selectedItem: String, isSelected: Bool)
}

