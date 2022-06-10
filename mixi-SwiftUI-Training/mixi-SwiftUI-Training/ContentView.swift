//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
                .padding()
            
            Text("Good evening, world!")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
