//
//  FilterPicker.swift
//  EdvoraTask
//
//  Created by Rizwan on 1/29/22.
//

import SwiftUI

struct FilterPicker: View {
    var title: String = ""
    @State var selected: String = ""
    var items = [String]()
    let onChange: ((String) -> Void)
    
    var body: some View {
        Picker(title, selection: $selected){
            ForEach(items, id: \.self){
                Text($0)
            }
        }.pickerStyle(WheelPickerStyle())
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
        .onChange(of: selected) { newValue in
            onChange(selected)
        }
    }
}

//struct FilterPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterPicker()
//    }
//}
