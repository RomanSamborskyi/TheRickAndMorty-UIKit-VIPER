//
//  CharactersInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit


protocol CharactersInteractorPrortocol: AnyObject {
    func fetchCharacters()
    func fetchImage()
}


class CharactersInteractor {
    
    var characters: [Character] = []
    var posters: [Int: UIImage] = [:]
    weak var presenter: CharactersPresnterProtocol?
    let apiManager = APIManager()
    let imageDownloader = ImageDownloader()
    
}

//MARK: - prototcol conformation
extension CharactersInteractor: CharactersInteractorPrortocol {
    func fetchCharacters() {
        apiManager.loadData(with: "https://rickandmortyapi.com/api/character", for: CharacterResponse.self, complition: { [weak self] response in
            self?.characters = response.results
            self?.presenter?.charactersDidLoad(character: response.results)
        })
    }
    
    func fetchImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for character in self.characters {
                self.imageDownloader.downloadImage(with: character.id, for: character.image) { image in
                    self.posters[character.id] = image
                    self.presenter?.imageDidLoaded(image: self.posters)
                }
            }
        }
    }
}
