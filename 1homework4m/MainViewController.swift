//
//  MainViewController.swift
//  1homework4m
//
//  Created by mavluda on 12/4/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController{
    
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
    
    private lazy var basketButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        view.backgroundColor = .systemRed
        view.setTitleColor(.white, for: .normal)
        view.addTarget(nil, action: #selector(basketAction(view:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        collectionView.dataSource = self
        collectionView.delegate = self
        layoutSubviews()
    }
    
    private func initData(){
        Data.shared.addProduct(model: Product(name: "Pizza1", image: "1", cost: 100))
        Data.shared.addProduct(model: Product(name: "Pizza2", image: "2", cost: 200))
        Data.shared.addProduct(model: Product(name: "Pizza3", image: "3", cost: 300))
    }
    
    private func layoutSubviews(){
        view.addSubview (collectionView)
        collectionView.snp.makeConstraints {make in
            make.top.left.right.bottom.equalToSuperview()
        }
        view.addSubview (basketButton)
        basketButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func basketAction(view: UIButton){
        navigationController?.pushViewController(BasketController(), animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.shared.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.fillCell(model: Data.shared.getProduct(index: indexPath.row),index: indexPath)
        return cell
    }
}
