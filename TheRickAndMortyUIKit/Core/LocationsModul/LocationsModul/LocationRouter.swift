//
//  LocationRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol LocationRouterProtocol: AnyObject {
    func didLocationSelected(location: SingleLocation)
}

class LocationRouter {
    weak var view: LocationsViewController?
    
}
//MARK: - protocol conformation
extension LocationRouter: LocationRouterProtocol {
    func didLocationSelected(location: SingleLocation) {
        let detailVC = LocationDetailModuleBuilder.build(loaction: location)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
