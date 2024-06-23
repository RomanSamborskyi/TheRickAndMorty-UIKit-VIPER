//
//  EpisodeDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


protocol EpisodeDetailInteractorPrortocol: AnyObject {
    func getEpisode()
    func getCharacters()
}

class EpisodeDetailInteractor {
    
    weak var presenter: EpisodeDetailPresenterProtocol?
    let episode: Episode
    let apiManager = APIManager()
    let imageDownloader = ImageDownloader()
    
    init(episode: Episode) {
        self.episode = episode
    }
    
}
//MARK: - protocol conformation
extension EpisodeDetailInteractor: EpisodeDetailInteractorPrortocol {
    func getCharacters() {
        
        let cqueue = DispatchQueue(label: "chatacters.fetch.for.episode", attributes: .concurrent)
        
        cqueue.async { [weak self] in
            
            guard let self = self else { return }
            
            let group = DispatchGroup()
            var characters: [Character] = []
            var images: [Int : UIImage] = [:]
            
            for charURL in self.episode.characters {
                group.enter()
                apiManager.loadData(with: charURL, for: Character.self) { character in
                    characters.append(character)
                    self.imageDownloader.downloadImage(with: character.id, for: character.image) { image in
                        
                        images[character.id] = image
                        group.leave()
                    }
                }
              
            }
            group.notify(queue: .main) {
                self.presenter?.charactersDidShowed(characters: characters, images: images)
            }
        }
    }
    func getEpisode() {
        presenter?.epsisoeDidShowed(episode: episode)
    }
}
