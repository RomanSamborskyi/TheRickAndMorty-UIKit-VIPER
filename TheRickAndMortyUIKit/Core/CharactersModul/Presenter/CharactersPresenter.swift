//
//  CharacktersPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import Foundation

protocol CharactersPresnterProtocol: AnyObject {
    func viewContorllerDidLoad()
    func charactersDidLoad(character: [Character])
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
    func charactersDidLoad(character: [Character]) {
        
    }
    func viewContorllerDidLoad() {
        interactor?.fetchCharacters()
    }
}
