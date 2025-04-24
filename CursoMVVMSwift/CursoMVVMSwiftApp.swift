//
//  CursoMVVMSwiftApp.swift
//  CursoMVVMSwift
//
//  Created by Gustavo Lizárraga on 9/12/24.
//

import SwiftUI

@main
struct CursoMVVMSwiftApp: App {
    @StateObject private var viewModel = ToDoViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
