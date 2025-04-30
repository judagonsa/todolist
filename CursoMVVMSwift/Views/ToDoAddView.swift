//
//  ToDoAdd.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import SwiftUI

struct ToDoAddView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    @Binding var showed: Bool
    
    @State private var title = ""
    @State private var note = ""
    @State private var date = Date()
    
    var todo: ToDoItem? = nil
    
    private let dateRange: ClosedRange<Date> = {
        let caledar = Calendar.current
        let startDate = Date.now
        let endDate = caledar.date(byAdding: .year, value: 10, to: startDate) ?? startDate
        return startDate...endDate
    }()
    
    var isSaveEnabled: Bool {
        !viewModel.validateInput(ofText: title)
    }
    
    var body: some View {
        VStack {
            
            ToDoTextInput(
                "Ingrese el nombre de la tarea",
                text: $title,
                label: "Tarea"
            )
            
            ToDoTextInput(
                "(Opcional) Agrega una descripción de la tarea",
                text: $note,
                label: "Nota"
            )
            
            DatePicker(
                selection: $date,
                in: dateRange
            ) {
                Text("Fecha y hora")
                    .font(.title3)
            }
            .tint(.primary)
            .padding(.vertical, 8)
            
            
            Spacer()
            
            Button {
                if  let todo = todo {
                    viewModel.updateToDo(
                        todo: todo,
                        withTitle: title,
                        note: note,
                        date: date
                    )
                } else {
                    viewModel.addToDo(
                        withTitle: title,
                        note: note,
                        date: date
                    )
                }
                
                showed.toggle()
                
            }label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSaveEnabled ? Color(UIColor.systemGray5) : .teal)
                    .clipShape(.rect(cornerRadius: 10))
                    
            }
            .disabled(isSaveEnabled)
        }
        .onAppear {
            if let todo = todo {
                title = todo.title
                note = todo.note  ?? ""
                date = todo.date
            }
        }
    }
}

#Preview {
//    ToDoAdd(showed: true)
}
