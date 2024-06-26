//
//  CharactersModulBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit


class CharactersModulBuilder {
    static func build() -> CharactersViewController {
        let interactor = CharactersInteractor()
        let router = CharactersRouter()
        let presenter = CharactersPresenter(interactor: interactor, router: router)
        let characterViewController = CharactersViewController()
        
        characterViewController.presenter = presenter
        presenter.mainView = characterViewController
        interactor.presenter = presenter
        router.view = characterViewController
        return characterViewController
    }
}
