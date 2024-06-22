//
//  CharacterDetailRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import Foundation


protocol CharacterDetailRouterProtocol: AnyObject {
    
}
class CharacterDetailRouter {
    
    weak var view: CharacterDetailViewProtocol?
    
}
//MARK: - protocol conformation
extension CharacterDetailRouter: CharacterDetailRouterProtocol {
    
}
