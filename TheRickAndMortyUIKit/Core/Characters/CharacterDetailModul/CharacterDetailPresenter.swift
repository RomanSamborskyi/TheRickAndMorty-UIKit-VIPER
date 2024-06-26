//
//  CharacterDetailPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit



protocol CharacterDetailPresenterProtocol: AnyObject {
    func viewControllerDidLoad()
    func showCharacter(character: Character, withImage: UIImage)
    func show(episode: [Episode])
    func didEpisodeSelected(episode: Episode)
}


class CharacterDetailPresenter {
    
    weak var view: CharacterDetailViewController?
    var interactor: CharackterDetailInteractorProtocol
    var router: CharacterDetailRouterProtocol
    
    init(interactor: CharackterDetailInteractorProtocol, router: CharacterDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}
//MARK: - protocol conformation
extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    func didEpisodeSelected(episode: Episode) {
        router.didEpisodeDetailOpened(episode: episode)
    }
    func show(episode: [Episode]) {
        view?.didEpisodesShow(episode: episode)
    }
    func showCharacter(character: Character, withImage: UIImage) {
        view?.showCharacter(character: character, withImage: withImage)
    }
    
    func viewControllerDidLoad() {
        interactor.getCharacter()
    }
}
