//
//  ToDoItemView.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 28/04/25.
//

import SwiftUI

struct ToDoItemView: View {
    
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let todo: ToDoItem
    
    var body: some View {
        if !todo.id.isEmpty {
            VStack (alignment: .leading, spacing: 8) {
                HStack (alignment: .top, spacing: 4) {
                    Text(todo.date, format: .dateTime.day())
                        .font(.system(size: 44, weight: .semibold))
                    VStack (alignment: .leading, spacing: 8){
                        Text(todo.date, format: .dateTime.month())
                            .fontWeight(.semibold)
                        Text(todo.date, format: .dateTime.weekday(.abbreviated))
                            .fontWeight(.semibold)
                    }
                    Spacer(minLength: 2)
                }
                
                VStack {
                    Text(todo.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(12)
                }
                
                Spacer(minLength: 8)
                
                HStack {
                    Text("Hora:")
                    Text(todo.date, format: .dateTime.hour().minute())
                        .fontWeight(.thin)
                }
            }
            .padding()
            .background(Color.indigo)
            .clipShape(.rect(cornerRadius: 10))
        } else {
            EmptyView()
        }
    }
}

#Preview {
//    ToDoItemView()
}
