//
//  ToDoNoArchiveView.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 3/05/25.
//

import SwiftUI

struct ToDoNoArchiveView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (spacing: 8) {
            Text("No hay nota archivadas")
                .font(.title2)
            
            Button {
                dismiss()
            } label: {
                Text("Ver todas las notas")
                    .font(.headline)
                    .foregroundStyle(.teal)
            }
            .multilineTextAlignment(.center)
            .frame(width: 200)
        }
    }
}

#Preview {
    ToDoNoArchiveView()
}
