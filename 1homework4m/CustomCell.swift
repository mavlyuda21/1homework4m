//
//  CustomCell.swift
//  1homework4m
//
//  Created by mavluda on 12/4/23.
//

import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        view.backgroundColor = .blue
        view.setTitleColor(.white, for: .normal)
        view.addTarget(nil, action: #selector(plusTapped(view: )), for: .touchUpInside)
        return view
    }()
    
    var index: IndexPath?
    
    override func layoutSubviews() {
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(200)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(20)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview (descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-50)
        }
        
        addSubview(button)
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
            make.height.width.equalTo(44)
        }
    }
    
    func fillCell(model: Product, index: IndexPath){
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.name
        descriptionLabel.text = String(model.cost)
        self.index = index
    }
    
    @objc func plusTapped(view: UIButton){
        Data.shared.addBasket(index: index!.row)
        dump(Data.shared.getCount())
        dump(Data.shared.getBasketCount())
    }
    
    func makeButtonInvisible(){
        button.isHidden = true
    }
    
}
