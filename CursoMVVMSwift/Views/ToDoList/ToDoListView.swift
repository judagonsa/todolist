    //
    //  ToDoList.swift
    //  CursoMVVMSwift
    //
    //  Created by Julian González on 22/04/25.
    //

import SwiftUI

struct ToDoListView: View {
    
    
    @EnvironmentObject var viewModel: ToDoViewModel
    
    @State var showSheet: Bool = false
    @State var todoToPreview: ToDoItem? = nil
    
    let colums: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    private var unArchivedToDos: [ToDoItem] {
        viewModel.todos.filter { !$0.isArchive }
    }
    
    var body: some View {
        
        ZStack (alignment: .center) {
            ScrollView {
                if !unArchivedToDos.isEmpty {
                    LazyVGrid(columns: colums, spacing: 5) {
                        ForEach(unArchivedToDos) { todo in
                            ToDoItemView(todo: todo)
                                .onTapGesture {
                                    todoToPreview = todo
                                }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    NoteToDoView(showCreationSheet: $showSheet)
                        .offset(y: UIScreen.main.bounds.height * 0.3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if showSheet {
                    ToDoSheet(isShow: $showSheet) {
                        ToDoAddView(showed: $showSheet)
                    }
                    .ignoresSafeArea(.keyboard)
                } else if todoToPreview != nil {
                    ToDoPreviewView(todo: $todoToPreview)
                }
            }
            
        }
        .navigationTitle("Notas")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    NavigationLink {
                        ToDoArchiveListView()
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                    
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .navigationBarHidden(showSheet || todoToPreview != nil)
        
    }
}

#Preview {
    ToDoListView()
}
