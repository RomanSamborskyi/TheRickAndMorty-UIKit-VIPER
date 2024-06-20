//
//  CharactersInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import Foundation



protocol CharactersInteractorPrortocol: AnyObject {
    func fetchCharacters()
}


class CharactersInteractor {
    weak var presenter: CharactersPresnterProtocol?
    
    let apiManager = APIManager()
}

//MARK: - prototcol conformation
extension CharactersInteractor: CharactersInteractorPrortocol {
    func fetchCharacters() {
        apiManager.loadData(with: "https://rickandmortyapi.com/api/character", for: CharacterResponse.self, complition: { [weak self] response in
            self?.presenter?.charactersDidLoad(character: response.results)
        })
    }
}
