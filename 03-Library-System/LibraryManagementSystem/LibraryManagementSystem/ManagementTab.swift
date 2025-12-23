//
//  ManagementTab.swift
//  LibraryManagementSystem
//
//  Created by Nguyễn Văn Thuận on 23/12/25.
//

import Foundation
import SwiftUI
struct ManagementTab: View {
    @ObservedObject var vm: LibraryViewModel
    @State private var editingName: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hệ thống\nQuản lý Thư viện")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Nhân viên").bold()
                HStack {
                    TextField("Tên nhân viên", text: $editingName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onAppear { editingName = vm.staffName }
                    
                    Button("Đổi") {
                        vm.staffName = editingName
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Danh sách sách").bold()
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach($vm.books) { $book in
                            HStack {
                                Image(systemName: book.isBorrowed ? "checkmark.square.fill" : "square")
                                    .foregroundColor(book.isBorrowed ? .red : .gray)
                                    .onTapGesture {
                                        book.isBorrowed.toggle()
                                    }
                                
                                Text(book.name)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                        }
                    }
                    .padding(2)
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                vm.addBook()
            }) {
                Text("Thêm")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
    }
}
