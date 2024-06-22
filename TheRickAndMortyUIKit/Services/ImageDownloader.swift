//
//  ImageDownloader.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit



class ImageDownloader {
    
    func downloadImage(with id: Int, for imageURL: String, complition: @escaping ((UIImage) -> Void)) {
        guard let url = URL(string: imageURL) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("error")
                return
            }
            guard let image = UIImage(data: data) else { return }
            complition(image)
        }
        session.resume()
    }
}
