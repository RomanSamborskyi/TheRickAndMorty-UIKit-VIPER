//
//  CharacterDetailModuleBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


class CharacterDetailModuleBuilder {
    static func build(charcter: Character, image: UIImage) -> CharacterDetailViewController {
        let view = CharacterDetailViewController()
        let interactor = CharackterDetailInteractor(character: charcter, image: image)
        let router = CharacterDetailRouter()
        let presenter = CharacterDetailPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
