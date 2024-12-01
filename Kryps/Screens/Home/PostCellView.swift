//
//  PostCellView.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import SwiftUI

struct PostCellView: View {
    var post: Post
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("\(post.userId)")
                            .foregroundStyle(.secondary)
                        
                        Text(post.postDate?.formatted(date: .abbreviated, time: .shortened) ?? "")
                    }
                    .font(.body)
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                    .padding(.bottom, 0)
                
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .padding(.bottom, 5)
                
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "bubble")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Text("Add comment")
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.up")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                    
                    Text("\(post.likes ?? 0)")
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.down")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .tint(.white)
        }        
    }
}
