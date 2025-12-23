//
//  LibraryManagementView.swift
//  LibraryManagementSystem
//
//  Created by Nguyễn Văn Thuận on 23/12/25.
//

import Foundation
import SwiftUI
struct LibraryManagementView: View {
    @StateObject var vm = LibraryViewModel()
    
    var body: some View {
        TabView {
            // Tab 1: Quản lý (Giao diện chính trong ảnh)
            ManagementTab(vm: vm)
                .tabItem {
                    Label("Quản lý", systemImage: "house.fill")
                }
            
            // Tab 2: Danh sách sách
            Text("Danh sách sách")
                .tabItem {
                    Label("DS Sách", systemImage: "book.pages.fill")
                }
            
            // Tab 3: Nhân viên
            Text("Thông tin nhân viên")
                .tabItem {
                    Label("Nhân viên", systemImage: "person.fill")
                }
        }
    }
}
