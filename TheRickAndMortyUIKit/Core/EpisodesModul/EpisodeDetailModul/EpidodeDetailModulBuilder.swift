//
//  EpidodeDetailModulBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


class EpidodeDetailModulBuilder {
    static func build() -> EpisodeDetailViewController {
        let view = EpisodeDetailViewController()
        let interactor =  EpisodeDetailInteractor()
        let router = EpisodeDetailRouter()
        let presenter = EpisodeDetailPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}


