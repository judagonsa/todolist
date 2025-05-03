//
//  ToDoViewModel.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import Foundation
import CoreData
import Combine

class ToDoViewModel: ObservableObject {
    @Published private(set) var todos: [ToDoItem] = []
    
    //evitar fugas de memorias
    var cancellables = Set<AnyCancellable>()
    
    var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init() {
        fetchToDos()
    }
    
    private func fetchToDos() {
       do {
           let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()
           let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
           
           request.sortDescriptors = [sortDescriptor]
           request.returnsObjectsAsFaults = false
           todos = try storeContainer.viewContext.fetch(request)
       } catch {
           print("Error al recuperar datos: \(error)")
       }
    }
    
    private func saveData() {
        do {
            try storeContainer.viewContext.save()
            fetchToDos()
        }catch {
            print("Error guardando datos")
        }
    }
    
    private func getToDoIndex(todo: ToDoItem) -> Int? {
        guard let index = todos.firstIndex(where: {$0.id == todo.id}) else {
            return nil
        }
        return index
    }
    
    func validateInput(ofText text: String) -> Bool {
        guard text.trimmingCharacters(in: .whitespaces).count > 2 else {
            return false
        }
        return true
    }
    
    public func addToDo(withTitle title: String, note: String, date: Date) {
        let newToDo = ToDoItem(context: storeContainer.viewContext)
        newToDo.id = UUID().uuidString
        newToDo.title = title
        newToDo.note = note
        newToDo.date = date
        newToDo.isCompleted = false
        newToDo.isFavorite = false
        newToDo.isArchive = false
        saveData()
    }
    
    public func updateToDo(
        todo: ToDoItem,
        withTitle title: String,
        note: String,
        date: Date
    ) {
        guard let index = getToDoIndex(todo: todo) else { return }
        
        todos[index].title = title
        todos[index].note = note
        todos[index].date = date
        saveData()
    }
    
    public func updateStatus(todo: ToDoItem) {
        guard let index = getToDoIndex(todo: todo) else { return }
        
        todos[index].isCompleted.toggle()
        saveData()
    }
    
    public func deleteToDo(todo: ToDoItem) {
        guard let index = getToDoIndex(todo: todo) else { return }
        let todoRemove = todos[index]
        storeContainer.viewContext.delete(todoRemove)
        saveData()
    }
    
    public func archiveToDo(todo: ToDoItem) {
        guard let index = getToDoIndex(todo: todo) else { return }
        todos[index].isArchive = true
        saveData()
    }
    
    public func unArchiveToDo(todo: ToDoItem) {
        guard let index = getToDoIndex(todo: todo) else { return }
        todos[index].isArchive = false
        saveData()
    }
}
