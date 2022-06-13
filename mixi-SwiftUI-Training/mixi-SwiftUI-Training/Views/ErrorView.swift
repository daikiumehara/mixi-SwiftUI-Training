//
//  ErrorView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import SwiftUI

struct ErrorView: View {
    var retryAction: () -> Void
    
    var body: some View {
        VStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Failed to load repositories")
                .foregroundColor(.gray)
            
            Button {
                retryAction()
            } label: {
                Text("Retry")
                    .bold()
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(retryAction: {})
    }
}
