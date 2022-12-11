//
//  LazyImageView.swift
//  MovieListTest
//
//  Created by Macbook on 03/12/22.
//

import Foundation
import UIKit

class LazyImageView: UIImageView{
    
    private var imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImageView(imageUrl: URL) {
        
        if let imageCached = imageCache.object(forKey: imageUrl as AnyObject){
            self.image = imageCached
        }else{
            DispatchQueue.global().async {[weak self] in
                if let imageData = try? Data(contentsOf: imageUrl){
                    if let image = UIImage(data: imageData){
                        DispatchQueue.main.async {
                            self?.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
