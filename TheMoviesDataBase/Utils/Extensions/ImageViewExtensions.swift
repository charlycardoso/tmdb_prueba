//
//  ImageViewExtensions.swift
//  TheMoviesDataBase
//
//  Created by Charly Cardoso on 04/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, _, error in
            
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
        }.resume()
    }
}
