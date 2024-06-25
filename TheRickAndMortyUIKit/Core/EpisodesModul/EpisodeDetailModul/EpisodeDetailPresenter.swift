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
    func charactersDidShowed(characters: [Character], images: [Int : UIImage])
    func didCharacterSelected(character: Character, image: UIImage)
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
    func didCharacterSelected(character: Character, image: UIImage) {
        router.didDetailOpenedFor(character: character, image: image)
    }
    func charactersDidShowed(characters: [Character], images: [Int : UIImage]) {
        view?.show(characters: characters, images: images)
    }
    
    func epsisoeDidShowed(episode: Episode) {
        view?.show(episode: episode)
    }
    
    func viewControllerDidLoad() {
        interactor.getEpisode()
        interactor.getCharacters()
    }
}
