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
        let cqueue = DispatchQueue(label: "loction.fetch", attributes: .concurrent)
        
        cqueue.async { [weak self] in
            guard let self = self else { return }
            self.apiManager.loadData(with: LocationsURLEndpopints.allLocations.endpoint, for: LocationRsponse.self) { result in
                switch result {
                case .success(let location):
                    DispatchQueue.main.async {
                        self.presenter?.didLocationsDownload(locations: location.results)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
