//
//  UIImageView+loadAndDisplayImage.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 25/12/2023.
//

import UIKit

extension UIImageView {
    
    func loadAndDisplayImage(from urlString: String) {
        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string: urlString),
               let imageData = try? Data(contentsOf: imageUrl),
               let image = UIImage(data: imageData) {

                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
