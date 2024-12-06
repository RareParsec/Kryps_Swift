//
//  ContentView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-28.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            Image("wallpaper")
                .resizable()
                .scaleEffect(1.05)
                .blur(radius: 20)
                .overlay{
                    ZStack{
                        Color.white.opacity(0.2)
                        Rectangle().background(.ultraThickMaterial).opacity(0.5)
                    }
                }
                    
            ScrollView{
                LazyVStack(spacing: 40){
                    ForEach(viewModel.posts, id: \.id) { post in
                        ZStack{
                            Rectangle()
                                .fill(Color.translucent)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            PostCellView(post: post)
                        }

                    }
                }
                .padding(.top, 100)
                .scrollViewOffsetPreferenceKey { offset in
                    viewModel.scrollOffset = offset
                }
            }
            .coordinateSpace(name: "scroll")
        }
        .task{
            
            await viewModel.getPosts()
            
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}



#Preview {
    HomeView()
}
