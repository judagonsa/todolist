//
//  ContentView.swift
//  CursoMVVMSwift
//
//  Created by Gustavo Lizárraga on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ToDoListView()
        }
        .tint(Color.primary)
    }
}

#Preview {
    ContentView()
}
