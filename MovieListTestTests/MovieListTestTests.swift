//
//  MovieListTestTests.swift
//  MovieListTestTests
//
//  Created by Macbook on 02/12/22.
//

import XCTest
@testable import MovieListTest

class MovieListTestTests: XCTestCase {
    
    func testMovieListViewModelNotNil(){
        let sut = MovieListTVCVM(imageUrl: "", title: "", description: "", releaseDate: "", popularity: 0.0, isFav: false, originalTitle: "", voteCount: 0)
        XCTAssertNotNil(sut.movieImageUrl)
        XCTAssertNotNil(sut.movieTitle)
        XCTAssertNotNil(sut.movieDescription)
        XCTAssertNotNil(sut.movieReleaseDate)
        XCTAssertNotNil(sut.moviePopularity)
        XCTAssertNotNil(sut.movieVoteCount)
        XCTAssertNotNil(sut.isFavourite)
        XCTAssertNotNil(sut.movieOriginalTitle)
    }

    func testMovieListViewModelNotEmpty(){
        let sut = MovieListTVCVM(imageUrl: "https://www.google.com", title: "Games", description: "test", releaseDate: "22-3-22", popularity: 0.0, isFav: false, originalTitle: "test", voteCount: 0)
        XCTAssertNotEqual(sut.movieImageUrl, "")
        XCTAssertNotEqual(sut.movieTitle, "")
        XCTAssertNotEqual(sut.movieDescription, "")
        XCTAssertNotEqual(sut.movieReleaseDate, "")
        XCTAssertNotEqual(sut.movieOriginalTitle, "")
    }
    
    func testMovieDetailsValuesNotNil() {
        let sut = MovieDetailsVCVM(imageUrl: "", title: "", description: "", releaseDate: "", popularity: 0.0, isFav: false, originalTitle: "", voteCount: 0)
        XCTAssertNotNil(sut.movieImageUrl)
        XCTAssertNotNil(sut.movieTitle)
        XCTAssertNotNil(sut.movieDescription)
        XCTAssertNotNil(sut.movieReleaseDate)
        XCTAssertNotNil(sut.moviePopularity)
        XCTAssertNotNil(sut.movieVoteCount)
        XCTAssertNotNil(sut.isFavourite)
        XCTAssertNotNil(sut.movieOriginalTitle)
    }
    
    func testMovieListTVCValuesNotNil() {
        let sut = MovieListTVCVM(imageUrl: "", title: "", description: "", releaseDate: "", popularity: 0.0, isFav: false, originalTitle: "", voteCount: 0)
        XCTAssertNotNil(sut.movieImageUrl)
        XCTAssertNotNil(sut.movieTitle)
        XCTAssertNotNil(sut.movieDescription)
        XCTAssertNotNil(sut.movieReleaseDate)
        XCTAssertNotNil(sut.moviePopularity)
        XCTAssertNotNil(sut.movieVoteCount)
        XCTAssertNotNil(sut.isFavourite)
        XCTAssertNotNil(sut.movieOriginalTitle)
    }
    
    func testCheckUrlNotEmpty(){
        XCTAssertNotEqual(Constant.movieUrl, "")
        XCTAssertNotEqual(Constant.imageBaseUrl, "")
    }
    
    func testCheckMovieUrlAndImageBaseUrl(){
        XCTAssertEqual(Constant.movieUrl, "https://api.themoviedb.org/3/search/movie?api_key=7e588fae3312be4835d4fcf73918a95f&query=a%20&page=")
        XCTAssertEqual(Constant.imageBaseUrl, "https://image.tmdb.org/t/p/w92")
    }
    
    func testMovieListNotEmptyOrNil() {
        let viewModel = MovieListVCVM()
        viewModel.callApiGetMovieData(netwrkManager: NetworkManager(), apiUrlString: Constant.movieUrl)
        XCTAssertNotEqual(viewModel.movieDataArr?.count, 0)
    }

    func testNetworkManagerCall() {
        let manager = NetworkManager()
        let expactation = self.expectation(description: "testNetworkManagerCall")
        manager.getApiData(requestUrl: URL(string: Constant.movieUrl)!, resultType: MovieDataModel.self) { result in
            XCTAssertNotNil(result)
            XCTAssertNotEqual(result?.total_pages, 0)
            XCTAssertEqual(result?.page, 1)
            XCTAssertNotEqual(result?.results.count, 0)
            expactation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
}
