//
//  ContentView.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/26/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    
    //MARK: State Variables
    @State private var showPopUp: Bool = false
    @State private var showProductsPicker = false
    @State private var showStatePicker = false
    @State private var showCityPicker = false
    @State private var selectedProduct = ""
    @State private var selectedState = ""
    @State private var selectedCity = ""
    
    //MARK: ViewModel
    @StateObject var viewModel = ProductsViewModel()

    
    var body: some View {
        let keys = viewModel.products.map{$0.key}
        let values = viewModel.products.map {$0.value}
        GeometryReader { geo in
            
            ZStack {
                VStack(alignment: .leading){
                    Spacer()
                    
                    //MARK: Header View
                    
                    Text("Edvora")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    Spacer()
                    HStack{
                        ZStack{
                            HStack{
                                Text("Filters")
                                    .padding()
                                    .foregroundColor(.white)
                                Spacer()
                                Image("popup-image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .padding()
                            }
                            .background(Color(red: 35/255, green: 35/255, blue: 35/255, opacity: 1))
                            .cornerRadius(8)
                        }
                        .padding(.leading)
                        .onTapGesture {
                            showPopUp.toggle()
                        }
                        
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Clear Filter")
                                .padding(.top)
                                .padding(.bottom)
                                
                                .foregroundColor(.white)
                                .onTapGesture {
                                    self.selectedProduct = ""
                                }
                            Spacer()
                            
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .background(Color(red: 35/255, green: 35/255, blue: 35/255, opacity: 1))
                        .cornerRadius(8)
                    }
                    .padding(.top)
                    .padding(.trailing, 3)
                    
                    //MARK: Products List
                    
                    ScrollView{
                        VStack{
                            if selectedProduct.isEmpty{
                                ForEach(keys.indices, id: \.self){index in
                                    ProductListRow(products: values[index], width: geo.size.width)
                                }
                            }
                            else{
                                ProductListRow(products: viewModel.products[selectedProduct] ?? [Products](), width: geo.size.width)
                            }
                            
                        }
                    }
                    .padding(.top)
                    .padding(.leading)
                    
                    Spacer()
                }
                .background(Color(red: 41/255, green: 41/255, blue: 41/255, opacity: 1))
                
                FilterPopup(show: $showPopUp, onProductTap: {
                    
                    showProductsPicker.toggle()
                }, onStateTap: {
                    showStatePicker.toggle()
                }, onCityTap: {
                    showCityPicker.toggle()
                })
                .padding()
                
                if showProductsPicker{                    
                    FilterPicker(title: "Products", selected: selectedProduct, items: viewModel.filters.products) { selection in
                        self.selectedProduct = selection
                        self.showProductsPicker.toggle()
                    }
                    
                }
                
                if showStatePicker && !(selectedProduct.isEmpty){
                    FilterPicker(title: "State", selected: selectedState, items: viewModel.filters.state[selectedProduct] ?? [String]()) { selection in
                        self.selectedState = selection
                        self.showStatePicker.toggle()
                    }
                    
                }
                
                
                if showCityPicker && !(selectedProduct.isEmpty) && !(selectedState.isEmpty){
                    
                    FilterPicker(title: "City", selected: selectedCity, items: viewModel.filters.city[selectedProduct] ?? [String]()) { selection in
                        self.selectedCity = selection
                        self.showCityPicker.toggle()
                    }
                    
                }
                    
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
