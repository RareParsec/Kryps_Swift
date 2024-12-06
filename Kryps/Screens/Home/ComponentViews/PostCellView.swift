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
        VStack{
            HStack{
                infoSection
                
                Spacer()
                
                optionsButton
            }
            
            Spacer().padding(.bottom, 0)
            
            contentSection
            
            Spacer().padding(.bottom, 5)
            
            HStack{
                commentSection
                Spacer()
                voteBar
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .tint(.white)
    }
    
}

extension PostCellView{
    private var infoSection: some View {
        VStack(alignment: .leading){
            Text("\(post.userId)")
                .foregroundStyle(.secondary)
            
            Text(post.postDate?.formatted(date: .abbreviated, time: .shortened) ?? "")
        }
        .font(.system(size: 14))
    }
    
    private var optionsButton: some View {
        Button{
            
        } label: {
            Image(systemName: "ellipsis")
                .font(.system(size: 16))
                .fontWeight(.bold)
        }
    }
    
    private var contentSection: some View {
        Text(post.title)
            .font(.system(size: 22))
            .fontWeight(.bold)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var commentSection: some View {
        Button {
            
        } label: {
            Image(systemName: "bubble")
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            Text("Add comment")
                .font(.system(size: 15))
        }
        
    }
    
    private var voteBar: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrowshape.up")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            
            Text("\(post.likes ?? 0)")
                .font(.system(size: 16))
            
            Button {
                
            } label: {
                Image(systemName: "arrowshape.down")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
        }
    }
}
