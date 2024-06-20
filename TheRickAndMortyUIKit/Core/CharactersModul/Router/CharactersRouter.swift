//
//  CharactersRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import Foundation


protocol CharactersRouterProtocol: AnyObject {
    
}


class CharactersRouter {
    weak var presenter: CharactersPresnterProtocol?
}

//MARK: - protocol conformation
extension CharactersRouter: CharactersRouterProtocol {
    
}
