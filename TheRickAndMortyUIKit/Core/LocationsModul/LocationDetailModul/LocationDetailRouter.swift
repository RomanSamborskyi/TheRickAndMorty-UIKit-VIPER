//
//  LocationDetailRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit



protocol LocationDetailRouterProtocol: AnyObject {
    func didResidentSelected(resident: Character, image: UIImage)
}

class LocationDetailRouter: LocationDetailRouterProtocol {
    
    weak var view: LocationsDetailViewController?
    
    func didResidentSelected(resident: Character, image: UIImage) {
        let detailVC = CharacterDetailModuleBuilder.build(charcter: resident, image: image)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
