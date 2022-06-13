//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44.0, height: 44.0)
            
            VStack(alignment: .leading) {
                Text("Owner Name")
                    .font(.caption)
                
                Text("Repository Name")
                    .fontWeight(.semibold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
