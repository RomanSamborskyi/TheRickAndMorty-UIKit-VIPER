//
//  EpisodesModulBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


class EpisodesModulBuilder {
    static func build() -> EpisodesViewController {
        let view = EpisodesViewController()
        let interactor = EpisodesInteractor()
        let router = EpisodesRouter()
        let presenter = EpisodesPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
