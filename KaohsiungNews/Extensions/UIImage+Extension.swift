//
//  UIImage+Extension.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation
import UIKit

extension UIImage {
    /// Default Image placeHolder
    static public func imageForPlaceHolder() -> UIImage {
        return UIImage(named: "placeholder")!
    }
    
    /// Fetch Image from URL 
    /// - Parameters:
    ///   - url: String Type
    ///   - completion: UIImage
    static public func image(url: String, completion: @escaping (UIImage) -> Void) {
        
        guard let imageURL = URL(string: url) else {
            completion(UIImage.imageForPlaceHolder())
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                if let downloadImage = UIImage(data: data) {
                    completion(downloadImage)
                }
            }
        }
        
    }
}
