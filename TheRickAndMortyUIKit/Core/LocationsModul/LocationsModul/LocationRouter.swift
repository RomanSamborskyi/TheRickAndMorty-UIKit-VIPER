//
//  LocationRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol LocationRouterProtocol: AnyObject {
    
}

class LocationRouter {
    weak var view: LocationsViewController?
    
}
//MARK: - protocol conformation
extension LocationRouter: LocationRouterProtocol {
    
}
