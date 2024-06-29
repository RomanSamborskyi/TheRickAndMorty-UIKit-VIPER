//
//  CharackterDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol CharackterDetailInteractorProtocol: AnyObject {
    func getCharacter()
    func getLocation()
}

class CharackterDetailInteractor {
    
    let apiManager = APIManager()
    let character: Character
    let image: UIImage
    
    init(character: Character, image: UIImage) {
        self.character = character
        self.image = image
    }
    
    weak var presenter: CharacterDetailPresenterProtocol?
    
}
//MARK: - protocol conformation
extension CharackterDetailInteractor: CharackterDetailInteractorProtocol {
    
    func getLocation() {
        guard let locaionURL = character.location?.url  else { return }
        
        let cqueue = DispatchQueue(label: "character.location.fetch")
        
        cqueue.async { [weak self] in
            guard let self = self else { return }
            
            self.apiManager.loadData(with: locaionURL, for: SingleLocation.self) { result in
                switch result {
                case .success(let location):
                    DispatchQueue.main.async {
                        self.presenter?.showLocation(location: location)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    func getCharacter() {
        
        let cqueue = DispatchQueue(label: "character.detail.fetch")
        var episodes: [Episode] = []
       
        cqueue.async { [weak self] in
            
            guard let self = self else { return }
            
            for episodeURL in character.episode {
                apiManager.loadData(with: episodeURL, for: Episode.self) { result in
                    switch result {
                    case .success(let episode):
                        DispatchQueue.main.async {
                            episodes.append(episode)
                            self.presenter?.show(episode: episodes)
                        }
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                }
            }
        }
        
        self.presenter?.showCharacter(character: self.character, withImage: self.image)
    }
}
