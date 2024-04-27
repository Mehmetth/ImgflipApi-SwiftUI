//
//  AllMemesResponse.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

import Foundation

struct MemesResponse: Codable {
    let data: Memes
}

struct Memes: Codable{
    let memes: [Mem]
}

struct Mem: Codable,Identifiable,Hashable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
}
