//
//  ProductListRow.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/27/22.
//

import SwiftUI
import CAPageView

struct ProductListRow: View {
    var products: [Products]
    var width: CGFloat
    @State var currentIndex: Int = 0

    var body: some View {
        
        VStack(alignment: .leading){
            Text(products.first?.product_name ?? "Product Name")
                .foregroundColor(.white)
                .font(.title2)
            
            Divider()
                
                .background(.white)

            
            TabView{
                ForEach(products, id: \.self){row in
                    ProductRow(product: row, width: width)
                }.padding(.trailing, 10)
                    .padding(.bottom, width * 0.18)
                    .padding(.top)
                    
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(width: width, height: width * 0.8)
            
            
            
            
        }
        
        
    }
}

//struct ProductListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GeometryReader {geo in
//            ProductListRow(name: "Microsoft", width: geo.size.width)
//        }
//    }
//}
