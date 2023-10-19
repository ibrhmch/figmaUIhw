//
//  SearchBar.swift
//  Figma UI
//
//  Created by octopus on 10/19/23.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var isLocalSelected: Bool = true
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Spacer()
            
            HStack(spacing: 0) {
                        Button(action: {
                            isLocalSelected = true
                        }) {
                            Text("Stay Local")
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                                .background(isLocalSelected ? Color(red: 0.95, green: 0.85, blue: 0.8) : Color(red: 0.8, green: 0.7, blue: 0.6))
                                .cornerRadius(20)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button(action: {
                            isLocalSelected = false
                        }) {
                            Text("Go Global")
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                                .background(!isLocalSelected ? Color(red: 0.95, green: 0.85, blue: 0.8) : Color(red: 0.8, green: 0.7, blue: 0.6))
                                .cornerRadius(20)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .background(Color(red: 0.8, green: 0.7, blue: 0.6))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                    .padding()
            
            Spacer()
            Image("ProfilePicture")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .padding()    }
}

#Preview {
    SearchBar()
}
