//
//  EpisodesInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesInteractorPrortocol: AnyObject {
    func fetchEpisodes()
}

class EpisodesInteractor {
    
    var apiManager = APIManager()
    weak var presenter: EpisodesPresenterProtocol?
    
}
//MARK: - protocol conformation
extension EpisodesInteractor: EpisodesInteractorPrortocol {
    func fetchEpisodes() {
        let cqueue = DispatchQueue(label: "episodes", attributes: .concurrent)
        
        cqueue.async { [weak self] in
            guard let self = self else { return }
            self.apiManager.loadData(with: EpisodesURLEndpopints.allEpisodes.endpoint, for: EpisodesResponse.self) { result in
                
                switch result {
                case .success(let result):
                    DispatchQueue.main.async {
                        self.presenter?.episodesDidDowloaded(episodes: result.results)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
                
            }
        }
    }
}
