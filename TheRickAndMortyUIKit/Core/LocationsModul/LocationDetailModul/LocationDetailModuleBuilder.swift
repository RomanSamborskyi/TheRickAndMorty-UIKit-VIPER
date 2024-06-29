//
//  LoactionDetailModuleBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit

class LocationDetailModuleBuilder {
    static func build(loaction: SingleLocation) -> LocationsDetailViewController {
        let view = LocationsDetailViewController()
        let interactor = LocationDetailInteractor(location: loaction)
        let router = LocationDetailRouter()
        let presenter = LocationDetailPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        return view
    }
}
