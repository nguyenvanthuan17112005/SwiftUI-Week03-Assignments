//
//  ViewModel.swift
//  LibraryManagementSystem
//
//  Created by Nguyễn Văn Thuận on 23/12/25.
//

import Foundation
import SwiftUI
import Combine
// Model cho Sách
struct Book: Identifiable {
    let id = UUID()
    var name: String
    var isBorrowed: Bool = false
}

// Quản lý dữ liệu (ViewModel)
class LibraryViewModel: ObservableObject {
    @Published var staffName: String = "Nguyen Van A"
    @Published var books: [Book] = [
        Book(name: "Sách 01", isBorrowed: true),
        Book(name: "Sách 02", isBorrowed: true),
        Book(name: "Sách 03", isBorrowed: false)
    ]
    
    func addBook() {
        let newIndex = books.count + 1
        books.append(Book(name: "Sách 0\(newIndex)"))
    }
}	
