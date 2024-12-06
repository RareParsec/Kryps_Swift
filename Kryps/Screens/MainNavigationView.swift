//
//  TabbarView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import SwiftUI

struct MainNavigationView: View {
    @State var selection: TabItem = .home
    var body: some View {
        CustomTabView(selection: $selection) {
            HomeView()
                .customTabItem(.home, selection: $selection)
        
            Color.red
                .customTabItem(.book, selection: $selection)
            
            Color.green
                .customTabItem(.account, selection: $selection)
        }
        
//        TabView{
//            Tab("home", systemImage: "house") {
//                HomeView()
//            }
//            Tab("book", systemImage: "book") {
//                Color.green
//            }
//            Tab("person", systemImage: "person") {
//                Color.red
//            }
            
//                Color.black
//                    .customTabItem(.book, selection: $selection)
//                
//                Color.black
//                    .customTabItem(.account, selection: $selection)
            
        }
        
    }


#Preview {
    MainNavigationView()
}
