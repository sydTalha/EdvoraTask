//
//  ProductsViewModel.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/28/22.
//

import Foundation
import Alamofire


class ProductsViewModel: ObservableObject{
    
    //MARK: Observers
    
    @Published var products = [String: [Products]]()
    @Published var filters: FilterModel = FilterModel()
    
    
    //MARK: Initializer
    
    init(){
        fetchProducts()
    }
    
    
    //MARK: Methods
    
    func populateFilters(){
        for (key, value) in self.products{
            if !self.filters.products.contains(key){
                self.filters.products.append(key)
            }
            
            if (self.filters.city[key] == nil){
                self.filters.city[key] = [String]()
            }
            if (self.filters.state[key] == nil){
                self.filters.state[key] = [String]()
            }
            for prod in value{
                if !self.filters.state[key]!.contains(prod.address.state){
                    self.filters.state[key]!.append(prod.address.state)
                    
                }
                if !self.filters.city[key]!.contains(prod.address.city){
                    self.filters.city[key]!.append(prod.address.city)
                }
            }
        }
    }
        
    func fetchProducts(){
        AF.request(Constants.URL, method: .get, encoding: JSONEncoding.default)
        .responseJSON{
            response in
            if response.value != nil {
                if response.data != nil{
                    do{
                        let model = try JSONDecoder().decode([Products].self, from: response.data!)
                        DispatchQueue.main.async{
                        
                            self.products = self.parseProducts(products: model)
                            self.populateFilters()
                        }
                    }
                    catch{
                        print(error)
                    }
                }
            }
        }
    }
    
    
    func parseProducts(products: [Products]) -> [String: [Products]]{
        var dict = [String: [Products]]()
        
        for product in products {
            if (dict[product.product_name] == nil){
                dict[product.product_name] = [Products]()
                
            }
            dict[product.product_name]!.append(product)
            
            //populating filters as well in the same loop
            if !self.filters.products.contains(product.product_name){
                self.filters.products.append(product.product_name)
            }
            
            print(dict[product.product_name]!.count)
        }
    
        return dict
    }

}
