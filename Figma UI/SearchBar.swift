//
//  SearchBar.swift
//  Figma UI
//
//  Created by octopus on 10/19/23.
//

import SwiftUI

struct SearchBar: View {
    @State private var isLeftSelected: Bool = true
    private let buttonWidth: CGFloat = 100
    private let textHeight: CGFloat = 45
    private let buttonHeight: CGFloat = 40
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Spacer()
            
            ZStack(alignment: isLeftSelected ? .leading : .trailing) {
                // Highlighted Rectangle
                Rectangle()
                    .frame(width: buttonWidth, height: buttonHeight)
                    .foregroundColor(Color(red: 0.95, green: 0.85, blue: 0.8))
                    .cornerRadius(20)
                    .transition(.slide)
                    .padding(.horizontal, 5)
                
                // Buttons
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation {
                            isLeftSelected = true
                        }
                    }) {
                        Text("Stay Local")
                            .frame(width: buttonWidth, height: textHeight)
                            .background(Color.clear)
                            .foregroundColor(.black)
                            .padding(.horizontal, 5)
                    }
                    
                    
                    Button(action: {
                        withAnimation {
                            isLeftSelected = false
                        }
                    }) {
                        Text("Go Global")
                            .frame(width: buttonWidth, height: textHeight)
                            .background(Color.clear)
                            .foregroundColor(.black)
                            .padding(.horizontal, 5)
                    }
                } // Background for buttons
                
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
