//
//  LocationInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol LocationInteractorPrortocol: AnyObject {
    func fetchLocations()
}

class LocationInteractor {
    var apiManager = APIManager()
    weak var presenter: LocationsPresenterProtocol?
}
//MARK: - protocol conformation
extension LocationInteractor: LocationInteractorPrortocol {
    func fetchLocations() {
        let cqueue = DispatchQueue(label: "loction.fetch")
        
        cqueue.async { [weak self] in
            guard let self = self else { return }
            self.apiManager.loadData(with: "https://rickandmortyapi.com/api/location", for: LocationRsponse.self) { location in
                DispatchQueue.main.async {
                    self.presenter?.didLocationsDownload(locations: location.results)
                }
            }
        }
    }
}
