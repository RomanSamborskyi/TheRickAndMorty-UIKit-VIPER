//
//  EpisodesRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol EpisodesRouterProtocol: AnyObject {
    
}

class EpisodesRouter {
    
    weak var view: EpisodesViewController?
    
}
//MARK: - protocol conformation
extension EpisodesRouter: EpisodesRouterProtocol {
    
}
