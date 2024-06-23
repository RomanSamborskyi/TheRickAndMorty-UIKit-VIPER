//
//  EpisodeDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


protocol EpisodeDetailInteractorPrortocol: AnyObject {
    
}

class EpisodeDetailInteractor {
    
    weak var presenter: EpisodeDetailPresenterProtocol?
    
}
//MARK: - protocol conformation
extension EpisodeDetailInteractor: EpisodeDetailInteractorPrortocol {
    
}
