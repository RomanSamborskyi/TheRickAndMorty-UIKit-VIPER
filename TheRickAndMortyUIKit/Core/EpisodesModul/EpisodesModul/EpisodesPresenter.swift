//
//  EpisodesPresenter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesPresenterProtocol: AnyObject {
    func viewControllerDidLoad()
}

class EpisodesPresenter {
    
    weak var view: EpisodesViewProtocol?
    var interactor: EpisodesInteractorPrortocol
    var router: EpisodesRouterProtocol
    
    init(interactor: EpisodesInteractorPrortocol, router: EpisodesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
}
//MARK: - protocol conformation
extension EpisodesPresenter: EpisodesPresenterProtocol {
    func viewControllerDidLoad() {
        
    }
}
