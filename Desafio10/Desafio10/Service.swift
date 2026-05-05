//
//  Service.swift
//  Desafio10
//
//  Created by Turma01-7 on 04/05/26.
//

import Foundation
import Combine

struct Service{
    func fetchHP(url: URL) -> AnyPublisher<[Umidade], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Umidade].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
