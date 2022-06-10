//
//  RepoRow.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import SwiftUI

struct RepoRow: View {
    var repo: Repo
    
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 44.0, height: 44.0)
            
            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    .font(.caption)
                
                Text(repo.name)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(repo: Repo(id: 1, name: "Repo Name", owner: User(name: "Uesr Name")))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
