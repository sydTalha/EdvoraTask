//
//  ProductModel.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/27/22.
//

import Foundation


struct Products: Codable, Hashable{
    static func == (lhs: Products, rhs: Products) -> Bool {
        return lhs.product_name == rhs.product_name &&
        lhs.brand_name == rhs.brand_name &&
        lhs.price == rhs.price &&
        lhs.address == rhs.address &&
        lhs.discription == rhs.discription &&
        lhs.date == rhs.date &&
        lhs.time == rhs.time &&
        lhs.image == rhs.image
        
    }
    
    let product_name: String
    let brand_name: String
    let price: Int
    let address: Address
    let discription: String
    let date: String
    let time: String
    let image: String
}

struct Address: Codable, Hashable{
    let state: String
    let city: String
}








