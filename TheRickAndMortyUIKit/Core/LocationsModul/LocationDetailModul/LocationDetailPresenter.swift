//
//  LocationDetailPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit


protocol LocationDetailPresenterProtocol: AnyObject {
    func didViewControllerLoaded()
    func didLocationFetch(location: SingleLocation, residents: [Character], images: [Int:UIImage])
    func didResidentSelected(resident: Character, image: UIImage)
}

class LocationDetailPresenter: LocationDetailPresenterProtocol {

    weak var view: LocationsDetailViewController?
    let interactor: LocationDetailInteractorProtocol?
    let router: LocationDetailRouterProtocol?
    
    init(interactor: LocationDetailInteractorProtocol, router: LocationDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func didViewControllerLoaded() {
        interactor?.fetchLoaction()
    }
    func didLocationFetch(location: SingleLocation, residents: [Character], images: [Int:UIImage]) {
        view?.show(location: location, residents: residents, images: images)
    }
    func didResidentSelected(resident: Character, image: UIImage) {
        router?.didResidentSelected(resident: resident, image: image)
    }
}

