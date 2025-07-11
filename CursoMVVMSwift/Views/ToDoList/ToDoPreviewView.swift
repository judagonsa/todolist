    //
    //  ToDoPreviewView.swift
    //  CursoMVVMSwift
    //

import SwiftUI

struct ToDoPreviewView: View {
    
    @EnvironmentObject private var viewModel: ToDoViewModel
    @Binding var todo: ToDoItem?
    @State private var showTodoCreationSheet = false
    
    var body: some View {
        
        
        if let safeTodo = todo {
            
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.thinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        todo = nil
                    }
                
                VStack(spacing: 36) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(Date(),
                                 format: .dateTime
                                .weekday(.wide)
                                .day()
                                .month()
                                .year()
                                .hour()
                                .minute())
                            
                            Text(safeTodo.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        
                        ToDoStatusView(todo: safeTodo)
                    }
                    
                    if let note = safeTodo.note, !note.isEmpty {
                        Text(note)
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack(spacing: 16) {
                        Button {
                            showTodoCreationSheet = true
                        } label: {
                            Text("Editar")
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 32)
                                .overlay {
                                    Capsule(style: .circular)
                                        .stroke(Color.primary, lineWidth: 1)
                                }
                        }
                        Spacer()
                        Button {
                            viewModel.archiveToDo(todo: safeTodo)
                            todo = nil
                        } label: {
                            Text("Archivar")
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 32)
                                .overlay {
                                    Capsule(style: .circular)
                                        .stroke(Color.primary, lineWidth: 1)
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.indigo)
                .clipShape(.rect(cornerRadius: 10))
                .padding(8)
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(maxHeight: UIScreen.main.bounds.height)
            .zIndex(2)
            .overlay {
                if showTodoCreationSheet {
                    ToDoSheet(isShow: $showTodoCreationSheet) {
                        ToDoAddView(
                            showed: $showTodoCreationSheet,
                            todo: safeTodo
                        )
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}
