//
//  MovieListVC.swift
//  MovieListTest
//
//  Created by Macbook on 02/12/22.
//

import UIKit

class MovieListVC: UIViewController {
    //MARK: --------------- IBOutlet---------------
    @IBOutlet weak var movieListTblVw: UITableView!
    
    //MARK: --------------- Variables---------------
    var viewModel: MovieListVCVM?
    let cellReuseIdentifier = "movieCell"
    
    //MARK: --------------- LifeCycle Method---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieListVCVM()
        viewModel?.delegate = self
        callMovieApi()
        setupTableView()
    }
    
    private func setupTableView(){
        movieListTblVw.register(UINib(nibName: "MovieListTVC", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        movieListTblVw.dataSource = self
        movieListTblVw.delegate = self
    }
    
    private func callMovieApi(){
        viewModel?.callApiGetMovieData(netwrkManager: NetworkManager(), apiUrlString: Constant.movieUrl)
    }

}
//MARK: --------------- MovieListVC Extension ---------------
extension MovieListVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movieDataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieListTVC
        
        let imgUrl = viewModel?.movieDataArr?[indexPath.row].posterUrl ?? ""
        let title = viewModel?.movieDataArr?[indexPath.row].movieTitle ?? ""
        let date = viewModel?.movieDataArr?[indexPath.row].releaseDate ?? ""
        let description = viewModel?.movieDataArr?[indexPath.row].movieDescription ?? ""
        let popularity = viewModel?.movieDataArr?[indexPath.row].popularity ?? 0.0
        let isFavouite = viewModel?.movieDataArr?[indexPath.row].isFavourite ?? false
        let originalTitle = viewModel?.movieDataArr?[indexPath.row].originalTitle ?? ""
        let voteCount = viewModel?.movieDataArr?[indexPath.row].voteCount ?? 0
        
        cell.cellViewModel = MovieListTVCVM(imageUrl: imgUrl, title: title, description: description, releaseDate: date, popularity: popularity, isFav: isFavouite,originalTitle: originalTitle, voteCount: voteCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imgUrl = viewModel?.movieDataArr?[indexPath.row].posterUrl ?? ""
        let title = viewModel?.movieDataArr?[indexPath.row].movieTitle ?? ""
        let date = viewModel?.movieDataArr?[indexPath.row].releaseDate ?? ""
        let description = viewModel?.movieDataArr?[indexPath.row].movieDescription ?? ""
        let popularity = viewModel?.movieDataArr?[indexPath.row].popularity ?? 0.0
        let isFavouite = viewModel?.movieDataArr?[indexPath.row].isFavourite ?? false
        let originalTitle = viewModel?.movieDataArr?[indexPath.row].originalTitle ?? ""
        let voteCount = viewModel?.movieDataArr?[indexPath.row].voteCount ?? 0
        
        NavigationCordinator.sharedInstance.goToDetailsPage(controller: self, viewModel: MovieListTVCVM(imageUrl: imgUrl, title: title, description: description, releaseDate: date, popularity: popularity, isFav: isFavouite,originalTitle: originalTitle,voteCount: voteCount), _delegate: self)
    }
}

extension MovieListVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && viewModel?.isApiCalledAfterPagination == false){
            if (viewModel?.pageOffset ?? 0) < (viewModel?.totalPages ?? 0) {
                viewModel?.pageOffset += 1
                callMovieApi()
            }
        }
    }
}

extension MovieListVC: MovieListProtocol, MovieDetailsVCProtocol{
    func isFavouriteMovieSelected(selectedItem: String, isSelected: Bool) {
        viewModel?.updateFavouriteMovie(name: selectedItem,isSelected: isSelected)
    }
    
    func refreshTableView() {
        DispatchQueue.main.async {[weak self] in
            self?.movieListTblVw.reloadData()
            self?.viewModel?.isApiCalledAfterPagination = false
        }
    }
}
