//
//  ToDoAdd.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import SwiftUI

struct ToDoAdd: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                
            }label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .onAppear {
            
        }
    }
}

#Preview {
    ToDoAdd()
}
