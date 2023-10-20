//
//  ContentView.swift
//  Figma UI
//
//  Created by octopus on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SearchBar()

            ScrollView {
                PostCardView(name: "Ibrahim", date: "October 19, 2023", postId: "1")
                PostCardView(name: "Mohammad", date: "October 18, 2022", postId: "2")
            }

            Spacer()

            HStack {
                Image(systemName: "house")
                Spacer()
                Image(systemName: "plus.circle")
                Spacer()
                Image(systemName: "person.circle")
            }
            .font(.system(size: 25))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
