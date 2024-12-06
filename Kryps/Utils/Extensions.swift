//
//  Extensions.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import Foundation
import SwiftUI

extension Color {
    static let background: Color = Color.gray.opacity(0)
    static let translucent: Color = Color.black.opacity(0.3)
}


extension View {
    func scrollViewOffsetPreferenceKey (action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
        .background{
            GeometryReader{
                Color.clear.preference(key: HomeScrollViewOffset.self, value: -$0.frame(in: .named("scroll")).origin.y)
            }
        }
        .onPreferenceChange(HomeScrollViewOffset.self){
            action($0)
        }
    }
    
    func customTabItem(_ tab: TabItem, selection: Binding<TabItem>) -> some View {
        self
            .opacity(selection.wrappedValue == tab ? 1 : 0)
            .preference(key: TabItemsPreferenceKey.self, value: [tab])
    }
}
