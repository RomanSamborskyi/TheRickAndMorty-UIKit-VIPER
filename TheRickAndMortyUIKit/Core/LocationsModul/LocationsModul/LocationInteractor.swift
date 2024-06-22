//
//  LocationInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol LocationInteractorPrortocol: AnyObject {
    
}

class LocationInteractor {
    weak var presenter: LocationsPresenterProtocol?
}
//MARK: - protocol conformation
extension LocationInteractor: LocationInteractorPrortocol {
    
}
