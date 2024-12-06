//
//  PreferenceKeys.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-12-03.
//

import Foundation
import SwiftUICore

struct HomeScrollViewOffset: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct TabItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}


//struct TabItemsPreferenceKey: PreferenceKey {
//}
