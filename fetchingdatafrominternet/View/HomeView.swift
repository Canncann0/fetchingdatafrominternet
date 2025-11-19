//
//  HomeView.swift
//  fetchingdatafrominternet
//
//  Created by Dogancan turgut on 19.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                
                HStack(spacing: 10) {
                    
                    Text("\(user.id)")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.gray)
                    
                    VStack(alignment:.leading) {
        
                        Text("\(user.name)")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.primary)
                        Text("\(user.email)")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundStyle(Color.secondary)
                    }
                }
            }
        }
        .onAppear{
            viewModel.loadUser()
        }
        .navigationTitle("Users")
    }
    
    
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
