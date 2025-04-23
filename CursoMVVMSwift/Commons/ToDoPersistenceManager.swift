//
//  ToDoPersistenceManager.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import CoreData

class ToDoPersistenceManager {
    static let shared = ToDoPersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "ModelDataItem")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Error cargando notas \(error), \(error.userInfo)")
            } else {
                print("Carga de notas exitosa!")
            }
        }
        
    }
}
