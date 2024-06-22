//
//  CharactersRouter.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit


protocol CharactersRouterProtocol: AnyObject {
    func openDEtails(for character: Character, image: UIImage)
}


class CharactersRouter {
    weak var view: CharactersViewController?
}

//MARK: - protocol conformation
extension CharactersRouter: CharactersRouterProtocol {
    func openDEtails(for character: Character, image: UIImage) {
        let detailVC = CharacterDetailModuleBuilder.build(charcter: character, image: image)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
