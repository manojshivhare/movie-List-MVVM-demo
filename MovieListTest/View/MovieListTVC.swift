//
//  MovieListTVC.swift
//  MovieListTest
//
//  Created by Macbook on 02/12/22.
//

import UIKit

class MovieListTVC: UITableViewCell {
    //MARK: -----------IBOutlets---------
    @IBOutlet weak var movieImageView: LazyImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieReleaseDateLbl: UILabel!
    @IBOutlet weak var movieDescLbl: UILabel!
    @IBOutlet weak var movieRatingLbl: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    
    //MARK: -----------Variable---------
    var cellViewModel: MovieListTVCVM?{
        didSet{
            updateCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func updateCellData(){
        movieTitleLbl.text = cellViewModel?.movieTitle
        movieDescLbl.text = cellViewModel?.movieDescription
        if let date = cellViewModel?.movieReleaseDate {
            movieReleaseDateLbl.text = "Release Date: \(date)"
        }
        if let rating = cellViewModel?.moviePopularity {
            movieRatingLbl.text = "Ratings: \(rating)"
        }
        
        //Fetching image from url
        if let imageUrl = URL(string: cellViewModel?.movieImageUrl ?? ""){
            movieImageView.loadImageView(imageUrl: imageUrl)
        }
        
        if cellViewModel?.isFavourite == true{
            favImageView.image = UIImage(systemName: "heart.fill")
        }else{
            favImageView.image = UIImage(systemName: "heart")
        }
    }
}
