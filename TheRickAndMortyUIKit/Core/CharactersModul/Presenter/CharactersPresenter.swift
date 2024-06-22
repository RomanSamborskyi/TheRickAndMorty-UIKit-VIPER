//
//  CharacktersPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit

protocol CharactersPresnterProtocol: AnyObject {
    func viewContorllerDidLoad()
    func charactersDidLoad(character: [Character])
    func imageDidLoaded(image: [Int: UIImage])
}

class CharactersPresenter {
    
    weak var view: CharactersViewProtocol?
    var router: CharactersRouterProtocol?
    var interactor: CharactersInteractorPrortocol?
    
    init(interactor: CharactersInteractorPrortocol, router: CharactersRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}


//MARK: - protocol conforrmation
extension CharactersPresenter: CharactersPresnterProtocol {
    func imageDidLoaded(image: [Int: UIImage]) {
        view?.showCharacterImage(image: image)
    }
    func charactersDidLoad(character: [Character]) {
        view?.showCharacters(characters: character)
    }
    func viewContorllerDidLoad() {
        interactor?.fetchCharacters()
        interactor?.fetchImage()
    }
}
