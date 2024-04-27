//
//  Service.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

let apiKey = "fa9bc8815fb0fc61d5ef6b3da297a009"

func fetchMoviesFromAPI() async throws -> [Movie] {
    let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!

    let (data, _) = try await URLSession.shared.data(from: url)

    let decoded = try JSONDecoder().decode(MoviesResponse.self, from: data)

    return decoded.results
}
