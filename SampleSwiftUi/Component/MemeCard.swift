//
//  PostCard.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 26.04.2024.
//

import Foundation
import SwiftUI

struct MemeCard: View {
    var mem: Mem
    var body: some View {
        AsyncImage(url: URL(string: mem.url)) { image in
            image.image?
                .resizable()
                .aspectRatio( contentMode: .fit)
                .cornerRadius(10)
        }
    }
}
