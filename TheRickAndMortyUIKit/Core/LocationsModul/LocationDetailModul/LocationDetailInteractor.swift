//
//  LocationDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit

protocol LocationDetailInteractorProtocol: AnyObject {
    func fetchLoaction()
}

class LocationDetailInteractor: LocationDetailInteractorProtocol {
    
    let location: SingleLocation
    weak var presenter: LocationDetailPresenterProtocol?
    let apiManager = APIManager()
    let imageDownloader = ImageDownloader()
    
    init(location: SingleLocation) {
        self.location = location
    }
    
    func fetchLoaction() {
        
        let cqueue = DispatchQueue(label: "location.detail.get", attributes: .concurrent)
        
        let group = DispatchGroup()
        var characters: [Character] = []
        var images: [Int : UIImage] = [:]
        let semaphore = DispatchSemaphore(value: 1)
        
        
        cqueue.async { [weak self] in
            
            guard let self = self else { return }
            
            for residentsURL in self.location.residents {
                group.enter()
                self.apiManager.loadData(with: residentsURL, for: Character.self) { result in
                    switch result {
                    case .success(let resident):
                        semaphore.signal()
                        characters.append(resident)
                        semaphore.wait()
                        
                        group.enter()
                        self.imageDownloader.downloadImage(with: resident.id, for: resident.image) { result in
                            switch result {
                            case .success(let image):
                                images[resident.id] = image
                            case .failure(let failure):
                                print(failure.localizedDescription)
                            }
                            group.leave()
                        }
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                self.presenter?.didLocationFetch(location: self.location, residents: characters, images: images)
            }
        }
    }
}
