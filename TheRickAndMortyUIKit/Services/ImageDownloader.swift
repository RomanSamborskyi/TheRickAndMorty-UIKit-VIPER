//
//  ImageDownloader.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit



class ImageDownloader {
    
    func downloadImage(with id: Int, for imageURL: String, complition: @escaping (Result<UIImage, AppError>) -> Void) {
        guard let url = URL(string: imageURL) else {
            complition(.failure(AppError.badURL))
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                complition(.failure(AppError.badResponse))
                return
            }
            guard let image = UIImage(data: data) else {
                complition(.failure(AppError.invalidData))
                return
            }
            complition(.success(image))
        }
        session.resume()
    }
}
