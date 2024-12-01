//
//  ContentView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-28.
//

import SwiftUI

struct Skeleton: Identifiable {
    let id = UUID()
    let size: CGSize
}

struct HomeView: View {
    @State var posts: [Post] = []
    @State var scrollOffset: CGFloat = 00
    
    var body: some View {
        ZStack{
            GeometryReader{ _ in
                    Image("wallpaper")
                        .resizable()
                        .scaleEffect(1.05)
                        .blur(radius: 15)
                        .overlay {
                            ScrollView{
                                LazyVStack(spacing: 80){
                                    ForEach(posts) { post in
                                        ZStack{
                                            Rectangle()
                                                .fill()
                                                .clipShape(RoundedRectangle(cornerRadius: 20))

                                            PostCellView(post: post)
                                        }
                                        }
                                }
//                                .scrollPosition(y: scrollOffset)
                                .padding(.top, 100)
                            }
                            .blendMode(.destinationOut)
                            .background(
                                Image("wallpaper")
                                    .resizable()
                                    .scaleEffect(1.05)
                                    .blur(radius: 10)
                                    .overlay{
                                        Rectangle()
                                            .background(.ultraThinMaterial)
                                            .opacity(0.5)
                                    }
                            )
                            .compositingGroup()
                        }
                }

            GeometryReader{_ in
                ScrollView{
                    LazyVStack(spacing: 80){
                        ForEach(posts) { post in
                            PostCellView(post: post)
                        }
                    }
                    .padding(.top, 100)
                    .background{
                        GeometryReader{
                            Color.clear.preference(key: HomeScrollViewOffset.self, value: -$0.frame(in: .named("scroll")).origin.y)
                        }
                    }
                    .onPreferenceChange(HomeScrollViewOffset.self){
                        print("dedoko")
                        scrollOffset = $0
                    }
                }
                .coordinateSpace(name: "scroll")
            }
            
            Text("\(scrollOffset)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .task{
            do{
                posts = try await NetworkManager.shared.getPosts()
            }catch{}
        }
    }
}

struct HomeScrollViewOffset: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

#Preview {
    HomeView()
}
