//
//  CharackterDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol CharackterDetailInteractorProtocol: AnyObject {
    func getCharacter()
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
    func getCharacter() {
        
        var episodes: [Episode] = []
        
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
        
        self.presenter?.showCharacter(character: self.character, withImage: self.image)
    }
}
