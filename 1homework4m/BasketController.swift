//
//  BasketController.swift
//  1homework4m
//
//  Created by mavluda on 12/4/23.
//

import UIKit
import SnapKit

class BasketController: UIViewController{
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = . systemGreen
        view.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        layoutSubviews()
    }
    
    private func layoutSubviews(){
        view.addSubview (collectionView)
        collectionView.snp.makeConstraints {make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension BasketController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.shared.getBasketCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.fillCell(model: Data.shared.getBasketProduct(index: indexPath.row),index: indexPath)
        cell.makeButtonInvisible()
        return cell
    }
}
