//
//  AppError.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit


enum AppError: Error, LocalizedError {
    case badResponse, badURL, invalidData
    
    var errorDescription: String? {
        switch self {
        case .badResponse:
            "Bad response"
        case .badURL:
            "Bad url"
        case .invalidData:
            "Invalid data"
        }
    }
}
