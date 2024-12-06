//
//  CustomTabView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-12-03.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selection: TabItem
    @Binding var tabs: [TabItem]
    
    @Namespace var namespace
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: .infinity))
                .opacity(0.8)
            
            HStack(spacing: 25){
                ForEach(tabs, id:\.self){ tabItem in
                    Image(systemName: "\(tabItem.iconName)")
                        .font(.system(size: 19, weight: .bold))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(){
                            ZStack{
                                if selection == tabItem{
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.5))
                                        .overlay{Rectangle().background(.ultraThickMaterial).opacity(0.5)}
                                        .clipShape(RoundedRectangle(cornerRadius: .infinity))
                                        .matchedGeometryEffect(id: "TabItemBackground", in: namespace)
                                }
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                selection = tabItem
                            }
                        }
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 7)
        }
        .frame(height: 60)
        .padding(.horizontal, 10)
        
    }
}

enum TabItem: Hashable {
    case home, book, account
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .book: return "book"
        case .account: return "person"
        }
    }
    
    var title : String {
        switch self {
        case .home: return "Home"
        case .book: return "Book"
        case .account: return "Account"
        }
    }
}

#Preview {
    CustomTabBarView(selection: .constant(TabItem.home), tabs: .constant([.home,.account,.book]))
}
