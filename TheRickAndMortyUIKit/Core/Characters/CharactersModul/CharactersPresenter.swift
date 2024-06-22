//
//  CharacktersPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit

protocol CharactersPresnterProtocol: AnyObject {
    func viewContorllerDidLoad()
    func didDetailButtonTapped(for character: Character, image: UIImage)
    func charactersDidLoad(character: [Character])
    func imageDidLoaded(images: [Int: UIImage])
}

class CharactersPresenter {
    
    weak var mainView: CharactersViewProtocol?
    var router: CharactersRouterProtocol
    var interactor: CharactersInteractorPrortocol
    
    init(interactor: CharactersInteractorPrortocol, router: CharactersRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}


//MARK: - protocol conforrmation
extension CharactersPresenter: CharactersPresnterProtocol {
    func didDetailButtonTapped(for character: Character, image: UIImage) {
        router.openDEtails(for: character, image: image)
    }
    func imageDidLoaded(images: [Int: UIImage]) {
        mainView?.showCharacterImage(image: images)
    }
    func charactersDidLoad(character: [Character]) {
        mainView?.showCharacters(characters: character)
    }
    func viewContorllerDidLoad() {
        interactor.fetchCharacters()
    }
}
