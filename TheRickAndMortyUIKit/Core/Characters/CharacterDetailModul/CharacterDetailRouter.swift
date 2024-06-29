//
//  CharacterDetailRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import Foundation


protocol CharacterDetailRouterProtocol: AnyObject {
    func didEpisodeDetailOpened(episode: Episode)
    func didLocationOpsen(location: SingleLocation)
}
class CharacterDetailRouter {
    
    weak var view: CharacterDetailViewController?
    
}
//MARK: - protocol conformation
extension CharacterDetailRouter: CharacterDetailRouterProtocol {
    func didLocationOpsen(location: SingleLocation) {
        let detailVC = LocationDetailModuleBuilder.build(loaction: location)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
    func didEpisodeDetailOpened(episode: Episode) {
        let detailVC = EpisodeDetailModulBuilder.build(episode: episode)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
