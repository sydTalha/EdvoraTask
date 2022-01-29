//
//  ProductRow.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/27/22.
//

import SwiftUI


struct ProductRow: View {
    
    //MARK: vars
    var product: Products
    var width: CGFloat
    
    var body: some View {
        
            VStack(alignment: .leading){
                HStack{
                    AsyncImage(url: URL(string: product.image))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width * 0.28, height: width * 0.28, alignment: .center)
                        .cornerRadius(8)
                        .padding()
                        
                    VStack(alignment: .leading) {
                        Text(product.product_name)
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 3)
                            .padding(.trailing)
                        Text(product.brand_name)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                            .padding(.bottom, 2)
                        Text("$ \(product.price)")
                            .foregroundColor(Color.white)
                        
                    }
                    
                }
                HStack {
                    Text("\(product.address.city)")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                        .padding(.leading)
                    Spacer()
                    Text("Date: \(self.formateDate(date: product.date))")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                        .padding(.trailing)
                    Spacer()
                
                }.padding(.bottom)
                Text(product.discription)
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                    .padding(.leading)
                    .padding(.bottom)
                    .padding(.trailing)
                
            }.background(Color.black)
                .cornerRadius(7)
                .padding(.trailing, 30)
                
        
        
    }
    
    
    func formateDate(date: String)-> String{
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = Constants.timestampFr
        
        let ddate = dfmatter.date(from: date)
        
        dfmatter.dateFormat = "dd-MM-yyyy"
        if ddate != nil{
            let dateString = dfmatter.string(from: ddate ?? Date())
             
            return dateString
        }
        
        return ""
    }
}

