//
//  LocationsPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol LocationsPresenterProtocol: AnyObject {
    func viewControllerDidLoad()
    func didLocationsDownload(locations: [SingleLocation])
}


class LocationsPresenter {
    
    weak var view: LocationViewProtocol?
    var interactor: LocationInteractorPrortocol
    var router: LocationRouterProtocol
    
    init(interactor: LocationInteractorPrortocol, router: LocationRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
//MARK: - protocol conformation
extension LocationsPresenter: LocationsPresenterProtocol {
    func didLocationsDownload(locations: [SingleLocation]) {
        view?.show(locations: locations)
    }
    func viewControllerDidLoad() {
        interactor.fetchLocations()
    }
}
