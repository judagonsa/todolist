    //
    //  ToDoStatusView.swift
    //  CursoMVVMSwift
    //
    //  Created by Julian González on 3/05/25.
    //

import SwiftUI

struct ToDoStatusView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    public let todo: ToDoItem
    
    let disabled: Bool
    
    public init (
        todo: ToDoItem ,
        disabled: Bool = false
    ) {
        self.todo = todo
        self.disabled = disabled
    }
    
    public var body: some View {
        let imageName: String = todo.isCompleted ? "checkmark.circle.fill" : "circle"
        let width: CGFloat = todo.isCompleted ? 22 : 24
        let height: CGFloat = width
        
        
        Image(systemName: imageName)
            .resizable()
            .frame(width: width, height: height)
            .onTapGesture {
                viewModel.updateStatus(todo: todo)
            }
            .disabled(disabled)
        
    }
}

