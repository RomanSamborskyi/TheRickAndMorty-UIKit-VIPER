//
//  EpisodeDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


protocol EpisodeDetailInteractorPrortocol: AnyObject {
    func getEpisode()
}

class EpisodeDetailInteractor {
    
    weak var presenter: EpisodeDetailPresenterProtocol?
    let episode: Episode
    
    init(episode: Episode) {
        self.episode = episode
    }
    
}
//MARK: - protocol conformation
extension EpisodeDetailInteractor: EpisodeDetailInteractorPrortocol {
    func getEpisode() {
        presenter?.epsisoeDidShowed(episode: episode)
    }
}
