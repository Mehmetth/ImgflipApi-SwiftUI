//
//  HomeViewModel.swift
//  SampleSwiftUi
//
//  Created by Mehmet on 25.04.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allMemesResponse = [Mem]()
    @Published var showAlert: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init( dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
        getAllMemes()
    }
    
    func getAllMemes() {
        dataManager.getAllMemes()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.showAlert = true
                } else {
                    self.allMemesResponse = (dataResponse.value?.data.memes)!
                }
            }.store(in: &cancellableSet)
    }
}
