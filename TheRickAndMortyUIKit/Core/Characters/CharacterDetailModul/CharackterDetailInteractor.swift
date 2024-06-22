//
//  CharackterDetailInteractor.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit


protocol CharackterDetailInteractorProtocol: AnyObject {
    func getCharacter()
}

class CharackterDetailInteractor {
    
    let character: Character
    let image: UIImage
    
    init(character: Character, image: UIImage) {
        self.character = character
        self.image = image
    }
    
    weak var presenter: CharacterDetailPresenterProtocol?
    
}
//MARK: - protocol conformation
extension CharackterDetailInteractor: CharackterDetailInteractorProtocol {
    func getCharacter() {
        presenter?.showCharacter(character: character, withImage: image)
    }
}
