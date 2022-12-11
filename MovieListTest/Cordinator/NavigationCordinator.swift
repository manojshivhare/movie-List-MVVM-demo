//
//  NavigationCordinator.swift
//  MovieListTest
//
//  Created by Macbook on 03/12/22.
//

import Foundation
import UIKit

class NavigationCordinator {
    static let sharedInstance = NavigationCordinator()
    private let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    private init(){}
    
    func goToDetailsPage(controller: UIViewController, viewModel: MovieListTVCPVM, _delegate: MovieDetailsVCProtocol){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let movieDetailsVC = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        controller.present(movieDetailsVC, animated:true, completion:nil)
        movieDetailsVC.delegate = _delegate
        movieDetailsVC.updateDetailsViewData(VMData: viewModel)
    }
}
