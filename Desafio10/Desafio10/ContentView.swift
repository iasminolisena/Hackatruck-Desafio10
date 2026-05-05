//
//  ContentView.swift
//  Desafio10
//
//  Created by Turma01-7 on 04/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("Umidade")
                        .foregroundStyle(.blue)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    
                    ForEach(viewModel.info, id: \._id) { item in
                        
                        let valor = Double(item.umidade) ?? 0
                        var data: Date {
                            Date(timeIntervalSince1970: Double(item.tempo) / 1000)
                            }
                            
                            var segundosDesdeLeitura: Double {
                                Date().timeIntervalSince(data)
                            }
                        
                        VStack(spacing: 20) {
                            
                            Image(valor < 50 ? "planta-triste" : "planta-feliz")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                            
                            
                            ProgressView(value: valor, total: 100)
                                .progressViewStyle(.linear)
                                .tint(.cyan)
                                .frame(width: 200)
                            
                            Text("\(Int(valor))%")
                                .foregroundColor(.gray)
                            Text("\(data)")
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
