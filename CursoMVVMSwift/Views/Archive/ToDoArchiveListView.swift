    //
    //  ToDoArchiveListView.swift
    //  CursoMVVMSwift
    //
    //  Created by Julian González on 22/04/25.
    //

import SwiftUI

struct ToDoArchiveListView: View {
    @EnvironmentObject private var viewModel: ToDoViewModel
    
    private var archiveToDos: [ToDoItem] {
        viewModel.todos.filter{ $0.isArchive }
    }
    
    var body: some View {
        ScrollView {
            if !archiveToDos.isEmpty {
                ForEach(archiveToDos) { todo in
                    ZStack {
                        ToDoArchivedItemView(todo: todo)
                    }
                    .padding(.horizontal)
                }
            } else {
                Text("empty")
            }
        }
        .padding(.top, 16)
        .toolbarTitleDisplayMode(.inline)
        .navigationTitle("Archivadas")
    }
}

#Preview {
    ToDoArchiveListView()
}
