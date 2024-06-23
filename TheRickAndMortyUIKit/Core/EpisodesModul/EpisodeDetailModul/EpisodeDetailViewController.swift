//
//  EpisodeDetailViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit

protocol EpisodeDetailViewProtocol: AnyObject {
    func show(episode: Episode)
    func show(characters: [Character])
}

class EpisodeDetailViewController: UIViewController {
    
    //MARK: - property
    var presenter: EpisodeDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
//MARK: - protocol conformation
extension EpisodeDetailViewController: EpisodeDetailViewProtocol {
    func show(episode: Episode) {
        
    }
    
    func show(characters: [Character]) {
        
    }
}
