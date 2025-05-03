//
//  NoteToDoView.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 3/05/25.
//

import SwiftUI

struct NoteToDoView: View {
    
    @Binding var showCreationSheet: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text("No hay tareas aún")
                .font(.title2)
            
            Button {
                showCreationSheet.toggle()
            } label: {
                Text("Crear tarea")
                    .font(.headline)
                    .foregroundStyle(.teal)
            }
        }
    }
}

#Preview {
    NoteToDoView(showCreationSheet: .constant(true))
}
