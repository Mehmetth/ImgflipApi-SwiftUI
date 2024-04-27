//
//  ServiceProtocol.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func getAllMemes() -> AnyPublisher<DataResponse<MemesResponse, NetworkError>, Never>
}

class Service {
    static let shared: ServiceProtocol = Service()
    private init() { }
}

extension Service: ServiceProtocol {
    
    func getAllMemes() -> AnyPublisher<DataResponse<MemesResponse, NetworkError>, Never> {
        let url = URL(string: GET_MEMES)!
        
        return AF.request(url,
                          method: .get)
            .validate()
            .publishDecodable(type: MemesResponse.self)
            .map { response in
                debugPrint("Response: ", response)
                return response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
