//
//  APIManager.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import Foundation



class APIManager {
    
    func loadData<T: Codable>(with url: String, for type: T.Type, complition: @escaping (Result<T,AppError>) -> Void)  {
        guard let url = URL(string: url) else {
            complition(.failure(AppError.badURL))
            return
        }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            let data = self.sessionHandler(data: data, response: response)
            let decoder = JSONDecoder()
            
            switch data {
            case .success(let data):
                let result = try? decoder.decode(T.self, from: data)
                if let result = result {
                    complition(.success(result))
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        session.resume()
    }
    
    private func sessionHandler(data: Data?, response: URLResponse?) -> Result<Data, AppError> {
        guard let data = data,
              let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            return .failure(AppError.badResponse)
        }
        return .success(data)
    }
}




