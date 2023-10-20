//
//  PostCardView.swift
//  Figma UI
//
//  Created by octopus on 10/19/23.
//

import SwiftUI

struct PostCardView: View {
    var name: String
    var date: String
    var postId: String
    
    @State private var isExpanded = false
    @State private var selectedText: String?
    @State private var likeStatus: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack{
                HStack(alignment: .top, spacing: 4) {
                    ForEach(["Rec", "Restaurant", "Italian"], id: \.self) { text in
                        Text(text)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(self.selectedText == text ? Color.red.opacity(0.5) : Color.gray.opacity(0.2))
                            .cornerRadius(7)
                            .onTapGesture {
                                self.selectedText = text
                            }
                            .onAppear{
                                self.selectedText = name == "Ibrahim" ? "Rec" : "Italian"
                            }
                    }
                }
            }
            
            Spacer(minLength: 150)
            
            VStack{
                HStack {
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(name)")
                        Text("\(date)")
                            .font(.system(size: 10))
                    }
                    Spacer()
                    
                    Button(action: {
                        UserDefaults.standard.set(!likeStatus, forKey: "likeStatus\(postId)")
                        likeStatus = UserDefaults.standard.bool(forKey: "likeStatus\(postId)")
                    }) {
                        Image(systemName: "heart")
                            .foregroundStyle(likeStatus ? Color.red : Color.black)
                    }
                    
                    Image(systemName: "pencil")
                    Image(systemName: "ellipsis.bubble")
                        .padding(.leading)
                }
                .padding()
                
                Text("La Cuisine Paris: Dessert cooking class")
                    .font(.system(size: 15))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English and French")
                    .padding([.leading, .trailing, .bottom])
                    .font(.system(size: isExpanded ? 13 : 10))
                    .lineLimit(isExpanded ? nil : 2)
            }
            .background(
                Color.teal.opacity(0.9)
            )
            .cornerRadius(20)
            .padding()
            .onAppear{
                likeStatus = UserDefaults.standard.bool(forKey: "likeStatus\(postId)")
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
        .background(
            Image("catImage")
                .resizable()
                .opacity(0.9)
        )
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    PostCardView(name: "Ibrahim", date: "October 19, 2023", postId: "1")
}
