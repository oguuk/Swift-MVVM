//
//  SearchView.swift
//  StocksAppSwiftUI
//
//  Created by 오국원 on 2022/01/05.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    //state value를 보낼거기 때문에 binding을 사용
    //textbox에 valure를 typing하면 자동적으로 parent한테 update
    
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search",text:
                        self.$searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            
            Spacer()
        }.foregroundColor(.secondary)
        
            .background(Color(
                .secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
