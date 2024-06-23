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
    private(set) var characters: [Character] = []
    lazy private var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.height / 2.9)
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.identifier)
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    lazy private var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
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
        setupUIActivityView()
        activityView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.setupCollection()
            self.activityView.stopAnimating()
        }
    }
    func setupUIActivityView() {
        scrollView.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.style = .large
        
        NSLayoutConstraint.activate([
            activityView.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: UIScreen.main.bounds.height / 3.5),
            activityView.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            activityView.widthAnchor.constraint(equalToConstant: 90),
            activityView.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
    func setupScrollView() {
        let margins = view.layoutMarginsGuide
        self.view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    func setupCollection() {
        scrollView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: UIScreen.main.bounds.height / 3.5),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.9 * CGFloat(Double(characters.count) / 1.83))
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
        DispatchQueue.main.async {
            self.characters = characters
            self.collectionView.reloadData()
        }
    }
}
extension EpisodeDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.characters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
        cell.character = characters[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let character = characters[indexPath.row]
    }
}
