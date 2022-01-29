//
//  FilterPopup.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/27/22.
//

import SwiftUI

struct FilterPopup: View {
    
    //MARK: State Variables
    @Binding var show: Bool
    @State private var selectedProduct = ""
     
    //MARK: Callbacks
    let onProductTap: () -> Void
    let onStateTap: () -> Void
    let onCityTap: () -> Void
    
    
    var body: some View {
        if show{
            ZStack {
                VStack(alignment: .leading){
                    
                    Text("Filters")
                        .foregroundColor(Color(red: 165/255, green: 165/255, blue: 165/255, opacity: 1))
                        .fontWeight(.light)
                        .padding(.leading)
                        .padding(.top)
                        .font(.title)
                        
                    Divider()
                        .background(.white)
                        .padding(.leading)
                        .padding(.trailing)
                    VStack{
                        ZStack{
                            HStack{
                                Text("Products")
                                    .padding()
                                    .foregroundColor(.white)
                                Spacer()
                                Image("popup-image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding()
                            }
                            .background(Color(red: 35/255, green: 35/255, blue: 35/255, opacity: 1))
                            .cornerRadius(8)
                        }
                        .onTapGesture(perform: {
                            onProductTap()
                        })
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)
                        
                        ZStack{
                            HStack{
                                Text("State")
                                    .padding()
                                    .foregroundColor(.white)
                                Spacer()
                                Image("popup-image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding()
                            }
                            .background(Color(red: 35/255, green: 35/255, blue: 35/255, opacity: 1))
                            .cornerRadius(8)
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .onTapGesture {
                            onStateTap()
                        }
                        
                        ZStack{
                            HStack{
                                Text("City")
                                    .padding()
                                    .foregroundColor(.white)
                                Spacer()
                                Image("popup-image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding()
                            }
                            .background(Color(red: 35/255, green: 35/255, blue: 35/255, opacity: 1))
                            .cornerRadius(8)
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom)
                        .onTapGesture {
                            onCityTap()
                        }
                        
                    }
                    .padding(.bottom)
                    
                }
                
                .background(.black)
                .cornerRadius(12)
                .padding(.trailing)
            }
            
        }
        
        
    }
}

//struct FilterPopup_Previews: PreviewProvider {
//
//    static var previews: some View {
//        FilterPopup()
//    }
//}
