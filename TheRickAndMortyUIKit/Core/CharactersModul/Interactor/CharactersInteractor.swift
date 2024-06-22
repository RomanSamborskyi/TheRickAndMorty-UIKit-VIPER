//
//  CharactersInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit


protocol CharactersInteractorPrortocol: AnyObject {
    func fetchCharacters()
}


class CharactersInteractor {
    
    weak var presenter: CharactersPresnterProtocol?
    let apiManager = APIManager()
    let imageDownloader = ImageDownloader()
    
}

//MARK: - prototcol conformation
extension CharactersInteractor: CharactersInteractorPrortocol {
    
    func fetchCharacters() {
        
        let cqueue = DispatchQueue(label: "character.fetch", attributes: .concurrent)
        
        cqueue.async { [weak self] in
            
            guard let self = self else { return }
            
            self.apiManager.loadData(with: "https://rickandmortyapi.com/api/character", for: CharacterResponse.self, complition: { response in
                self.presenter?.charactersDidLoad(character: response.results)
                
                var images: [Int : UIImage] = [:]
                let dispatchGroup = DispatchGroup()
                
                for character in response.results {
                    dispatchGroup.enter()
                    self.imageDownloader.downloadImage(with: character.id, for: character.image) { image in
                        DispatchQueue.main.async {
                            images[character.id] = image
                        }
                        dispatchGroup.leave()
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    self.presenter?.imageDidLoaded(images: images)
                }
            })
        }
    }
}
