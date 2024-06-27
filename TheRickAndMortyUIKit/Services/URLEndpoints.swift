//
//  URLEndpoints.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit


enum CharacterURLEndpopints {
    case allCharacters
    
    var endpoint: String {
        switch self {
        case .allCharacters:
            "https://rickandmortyapi.com/api/character"
        }
    }
}

enum LocationsURLEndpopints {
    case allLocations
    
    var endpoint: String {
        switch self {
        case .allLocations:
            "https://rickandmortyapi.com/api/location"
        }
    }
}

enum EpisodesURLEndpopints {
    case allEpisodes
    
    var endpoint: String {
        switch self {
        case .allEpisodes:
            "https://rickandmortyapi.com/api/episode"
        }
    }
}
