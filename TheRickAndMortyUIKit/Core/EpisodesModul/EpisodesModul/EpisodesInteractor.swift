//
//  EpisodesInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesInteractorPrortocol: AnyObject {
    
}

class EpisodesInteractor {
    
    weak var presenter: EpisodesPresenterProtocol?
    
}
//MARK: - protocol conformation
extension EpisodesInteractor: EpisodesInteractorPrortocol {
    
}
