//
//  ContentView.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var column:Int = 2
    
    var body: some View {
        NavigationView {
            StaggeredGrid(list: viewModel.allMemesResponse, columns: column, content: { mem  in
                NavigationLink(destination: DetailView(mem: mem)){
                    MemeCard(mem: mem)
                }
                
            })
            .padding(.horizontal)
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("There is a problem with the network. Please try again later."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    HomeView()
}
