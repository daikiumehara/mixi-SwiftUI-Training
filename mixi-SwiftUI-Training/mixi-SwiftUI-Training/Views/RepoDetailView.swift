//
//  RepoDetailView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import SwiftUI

struct RepoDetailView: View {
    var repo: Repo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("GitHubMark")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text(repo.owner.name)
                        .font(.caption)
                }
                
                Text(repo.name)
                    .bold()
                
                Text(repo.description)
                    .padding(.top, 4)
                
                HStack {
                    Image(systemName: "star")
                    
                    Text("\(repo.stargazersCount) stars")
                }
                .padding(.top, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .mock1)
    }
}
