//
//  Data.swift
//  1homework4m
//
//  Created by mavluda on 12/4/23.
//

import Foundation

struct Product{
    var name, image: String
    var cost: Int
}

final class Data{
    
    static let shared = Data()
    
    private var products = [Product]()
    private var basket = [Product]()
    
    func addProduct(model: Product){
        products.append(model)
    }
    
    func addBasket(index: Int){
        basket.append(products[index])
    }
    
    func getCount() -> Int{
        return products.count
    }
    
    func getBasketCount() -> Int{
        return basket.count
    }
    
    func getProduct(index: Int) -> Product{
        return products[index]
    }
    
    func getBasketProduct(index: Int) -> Product{
        return basket[index]
    }
    
}
