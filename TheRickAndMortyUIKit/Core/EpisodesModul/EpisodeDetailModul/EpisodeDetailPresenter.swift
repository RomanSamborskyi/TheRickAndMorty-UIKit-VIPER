//
//  EpisodesDetailPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit



protocol EpisodeDetailPresenterProtocol: AnyObject {
    func viewControllerDidLoad()
    func epsisoeDidShowed(episode: Episode)
}

class EpisodeDetailPresenter {
    
    weak var view: EpisodeDetailViewProtocol?
    var interactor: EpisodeDetailInteractor
    var router: EpisodeDetailRouter
    
    init(interactor: EpisodeDetailInteractor, router: EpisodeDetailRouter) {
        self.interactor = interactor
        self.router = router
    }
    
}
//MARK: - protocol conformation
extension EpisodeDetailPresenter: EpisodeDetailPresenterProtocol {
    func epsisoeDidShowed(episode: Episode) {
        view?.show(episode: episode)
    }
    
    func viewControllerDidLoad() {
        interactor.getEpisode()
    }
}
