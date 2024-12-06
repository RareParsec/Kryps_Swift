//
//  CustomTabView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-12-03.
//

import SwiftUI

struct CustomTabView<Content: View> : View {
    @Binding var selection: TabItem
    @State var tabs: [TabItem] = []
    
    let content: Content
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                content
                    .ignoresSafeArea()

                CustomTabBarView(selection: $selection, tabs: $tabs)
            }
        }
        .onPreferenceChange(TabItemsPreferenceKey.self) { tabs in
            self.tabs = tabs
        }
    }
    
    public init(selection: Binding<TabItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
}




#Preview {
    CustomTabView(selection: .constant(TabItem.home)) {
        Color.red
    }
}

