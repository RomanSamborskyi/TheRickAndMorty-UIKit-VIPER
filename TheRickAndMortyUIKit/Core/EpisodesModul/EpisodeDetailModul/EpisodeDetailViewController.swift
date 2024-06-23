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
    lazy private var detailView = EpisodeDetailView()
    lazy private var scrollView: UIScrollView = { 
        let view = UIScrollView()
        return view
    }()
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.height / 2.9)
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.identifier)
        return cell
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        presenter?.viewControllerDidLoad()
        setupLayout()
    }
}
//MARK: - setup layout
private extension EpisodeDetailViewController {
    func setupLayout() {
        setupScrollView()
    }
    func setupScrollView() {
        let margins = view.layoutMarginsGuide
        self.view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            heightConstraint.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint
        ])
    }
}
//MARK: - protocol conformation
extension EpisodeDetailViewController: EpisodeDetailViewProtocol {
    func show(episode: Episode) {
        DispatchQueue.main.async {
            self.detailView.update(episode: episode)
        }
    }
    
    func show(characters: [Character]) {
        
    }
}

