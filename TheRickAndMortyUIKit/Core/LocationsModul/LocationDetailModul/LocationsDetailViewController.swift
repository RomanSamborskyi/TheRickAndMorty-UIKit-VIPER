//
//  LocationsDetailViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit

protocol LocationDetailViewProtocol: AnyObject {
    func show(location: SingleLocation, residents: [Character], images: [Int : UIImage])
}
class LocationsDetailViewController: UIViewController {
    
    
    var presenter: LocationDetailPresenterProtocol?
    lazy private var detailView = LocatioDetailView()
    private(set) var residents: [Character] = []
    private(set) var images: [Int:UIImage] = [:]
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
        presenter?.didViewControllerLoaded()
        setupLayout()
    }
}
//MARK: - layout
private extension LocationsDetailViewController {
    func setupLayout() {
        setupScrollView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.setupCollection()
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
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.9 * CGFloat(Double(residents.count) / 1.83))
        ])
    }
}
//MARK: - protocol conformation
extension LocationsDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.residents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
        let character = self.residents[indexPath.row]
        cell.character = character
        cell.poster = self.images[character.id]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.residents[indexPath.row]
        guard let itemImage = self.images[item.id] else { return }
        presenter?.didResidentSelected(resident: item, image: itemImage)
    }
}
extension LocationsDetailViewController: LocationDetailViewProtocol {
    func show(location: SingleLocation, residents: [Character], images: [Int : UIImage]) {
        DispatchQueue.main.async {
            self.detailView.update(location: location)
            self.residents.append(contentsOf: residents)
            self.images = images
        }
    }
}
