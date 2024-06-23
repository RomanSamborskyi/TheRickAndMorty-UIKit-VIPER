//
//  EpisodesPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesPresenterProtocol: AnyObject {
    func viewControllerDidLoad()
    func episodesDidDowloaded(episodes: [Episode])
    func episodeDidSelected(episode: Episode)
}

class EpisodesPresenter {
    
    weak var view: EpisodesViewProtocol?
    var interactor: EpisodesInteractorPrortocol
    var router: EpisodesRouterProtocol
    
    init(interactor: EpisodesInteractorPrortocol, router: EpisodesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}
//MARK: - protocol conformation
extension EpisodesPresenter: EpisodesPresenterProtocol {
    func episodeDidSelected(episode: Episode) {
        router.episoeDidOpened(episode: episode)
    }
    func episodesDidDowloaded(episodes: [Episode]) {
        view?.show(episodes: episodes)
    }
    func viewControllerDidLoad() {
        interactor.fetchEpisodes()
    }
}
