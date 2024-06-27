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
        let cqueue = DispatchQueue(label: "location.detail.get")
        
        cqueue.async { [weak self] in
            
            guard let self = self else { return }
            
            let group = DispatchGroup()
            var characters: [Character] = []
            var images: [Int : UIImage] = [:]
            let lock = NSLock()
            
            for residentsURL in self.location.residents {
                
                group.enter()
                
                self.apiManager.loadData(with: residentsURL, for: Character.self) { resident in
                    lock.lock()
                    characters.append(resident)
                    lock.unlock()
                    
                    group.enter()
                    self.imageDownloader.downloadImage(with: resident.id, for: resident.image) { image in
                        DispatchQueue.main.async {
                            lock.lock()
                            images[resident.id] = image
                            lock.unlock()
                        }
                        group.leave()
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
