//
//  ToDoList.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var showSheet: Bool = false
    
    let colums: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .center) {
                ScrollView {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    if showSheet {
                        ToDoSheet(isShow: $showSheet) {
                            ToDoAddView(showed: $showSheet)
                        }
                        .ignoresSafeArea(.keyboard)
                    }
                }
                
            }
            .navigationTitle("Notas")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        NavigationLink {
                            
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
        }
    }
}

#Preview {
    ToDoListView()
}
