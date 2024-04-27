//
//  ErrorModel.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
