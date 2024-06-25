//
//  EpisodeDetailRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


protocol EpisodeDetailRouterProtocol: AnyObject {
    func didDetailOpenedFor(character: Character, image: UIImage)
}

class EpisodeDetailRouter {
    
    weak var view: EpisodeDetailViewController?
    
}
//MARK: - protocol conformation
extension EpisodeDetailRouter: EpisodeDetailRouterProtocol {
    func didDetailOpenedFor(character: Character, image: UIImage) {
        let characterVC = CharacterDetailModuleBuilder.build(charcter: character, image: image)
        view?.navigationController?.pushViewController(characterVC, animated: true)
    }
}
