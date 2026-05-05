//
//  ViewModel.swift
//  Desafio10
//
//  Created by Turma01-7 on 04/05/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    
    @Published var info: [Umidade] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.233:1880/ver") else{
            return
        }
        service.fetchHP(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { arduino in
                self.info = arduino
            }
            .store(in: &cancellables)
    }
}
