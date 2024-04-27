//
//  DetailView.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 26.04.2024.
//

import SwiftUI

struct DetailView: View {
    let mem: Mem
    
    var body: some View {
        VStack(alignment: .leading){
            MemeCard(mem: mem)
            Text(mem.name).foregroundStyle(.black).font(.title).bold().padding(.top, 10)
        }
    }
}

#Preview {
    DetailView(mem: Mem(id: "123", name: "Mem", url: "https://...", width: 500, height: 600, box_count: 1))
}
