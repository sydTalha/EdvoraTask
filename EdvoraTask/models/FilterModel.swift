//
//  FilterModel.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/29/22.
//

import Foundation

struct FilterModel{
    var products: [String] = [String]()
    
    var city: [String: [String]] = [String: [String]]()
    var state: [String: [String]] = [String: [String]]()
}
