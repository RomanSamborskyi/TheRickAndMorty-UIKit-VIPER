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
            
            self.apiManager.loadData(with: CharacterURLEndpopints.allCharacters.endpoint, for: CharacterResponse.self, complition: { result in
                
                switch result {
                case .success(let response):
                    self.presenter?.charactersDidLoad(character: response.results)
                    
                    var images: [Int : UIImage] = [:]
                    let dispatchGroup = DispatchGroup()
                    
                    for character in response.results {
                        dispatchGroup.enter()
                        self.imageDownloader.downloadImage(with: character.id, for: character.image) { result in
                            switch result {
                            case .success(let image):
                                images[character.id] = image
                            case .failure(let failure):
                                print(failure.localizedDescription)
                            }
                            dispatchGroup.leave()
                        }
                    }
                    
                    dispatchGroup.notify(queue: .main) {
                        self.presenter?.imageDidLoaded(images: images)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            })
        }
    }
}
