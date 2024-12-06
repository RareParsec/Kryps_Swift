//
//  HomeViewModel.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-12-01.
//

import Foundation
import SwiftUICore

final class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var scrollOffset: CGFloat = 0
    
    func getPosts() async {
        
        do{
            posts = try await NetworkManager.shared.getPosts()
        } catch {
            
        }
    }
}

