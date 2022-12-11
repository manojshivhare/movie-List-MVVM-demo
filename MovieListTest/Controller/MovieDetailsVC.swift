//
//  MovieDetailsVC.swift
//  MovieListTest
//
//  Created by Macbook on 03/12/22.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    //MARK: -----------IBOutlets---------
    @IBOutlet weak var movieImageVw: LazyImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var ratingsLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var originalTitleLbl: UILabel!
    @IBOutlet weak var voteCountLbl: UILabel!
    @IBOutlet weak var favouriteBtnObj: UIButton!
    
    //MARK: -----------Variable---------
    private var viewModel: MovieDetailsVCVM?{
        didSet{
            updateData()
        }
    }
    weak var delegate: MovieDetailsVCProtocol?
    //MARK: -----------LifeCycle Method---------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: -----------UpdateData in Private method---------
    private func updateData(){
        if let title = viewModel?.movieTitle{
            titleLbl.text = "Title: \(title)"
        }
        
        if let date = viewModel?.movieReleaseDate{
            dateLbl.text = "Release Date: \(date)"
        }
        
        if let description = viewModel?.movieDescription{
            descriptionLbl.text = "Overview: \(description)"
        }
        
        if let rating = viewModel?.moviePopularity{
            ratingsLbl.text = "Ratings: \(rating)"
        }
        
        if let originaltitle = viewModel?.movieOriginalTitle {
            originalTitleLbl.text = "Original Title: \(originaltitle)"
        }
        
        if let voteCount = viewModel?.movieVoteCount{
            voteCountLbl.text = "Vote Count: \(voteCount)"
        }
        
        movieImageVw.loadImageView(imageUrl: URL(string: viewModel?.movieImageUrl ?? "")!)
        
        if viewModel?.isFavourite == true{
            favouriteBtnObj.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favouriteBtnObj.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }

    //MARK: -----------Update Controller Data from Previous screen---------
    func updateDetailsViewData(VMData: MovieListTVCPVM) {
        viewModel = MovieDetailsVCVM(imageUrl: VMData.movieImageUrl, title: VMData.movieTitle, description: VMData.movieDescription, releaseDate: VMData.movieReleaseDate, popularity: VMData.moviePopularity, isFav: VMData.isFavourite,originalTitle: VMData.movieOriginalTitle,voteCount: VMData.movieVoteCount)
    }
    
    
    @IBAction func favouriteBtnAction(_ sender: Any) {
        if viewModel?.isFavourite == false{
            favouriteBtnObj.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            delegate?.isFavouriteMovieSelected(selectedItem: viewModel?.movieTitle ?? "",isSelected: true)
        }else{
            favouriteBtnObj.setImage(UIImage(systemName: "heart"), for: .normal)
            delegate?.isFavouriteMovieSelected(selectedItem: viewModel?.movieTitle ?? "",isSelected: false)
        }
        dismiss(animated: true)
    }
    
}
