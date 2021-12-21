//
//  ImageView.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 12/12/2021.
// Need to change the way to load Image

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(with urlString:String) {
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
        }else {
            if let url = URL(string: urlString) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            if let downloadImage = UIImage(data: data) {
                                imageCache.setObject(downloadImage, forKey: urlString  as NSString)
                                self.image = downloadImage
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
