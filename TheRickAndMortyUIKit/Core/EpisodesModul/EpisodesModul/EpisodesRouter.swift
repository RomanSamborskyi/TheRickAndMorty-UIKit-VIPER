//
//  EpisodesRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesRouterProtocol: AnyObject {
    func episoeDidOpened(episode: Episode)
}

class EpisodesRouter {
    
    weak var view: EpisodesViewController?
    
}
//MARK: - protocol conformation
extension EpisodesRouter: EpisodesRouterProtocol {
    func episoeDidOpened(episode: Episode) {
        let detailVC = EpisodeDetailModulBuilder.build(episode: episode)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
