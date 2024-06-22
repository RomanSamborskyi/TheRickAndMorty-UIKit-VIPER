//
//  LocationsModulBuilder.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


class LocationsModulBuilder {
    static func build() -> LocationsViewController {
        let view = LocationsViewController()
        let interactor = LocationInteractor()
        let router = LocationRouter()
        let presenter = LocationsPresenter(interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        presenter.view = view
        
        return view
    }
}
