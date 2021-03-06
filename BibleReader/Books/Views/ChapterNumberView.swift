//
//  ChapterNumberView.swift
//  BibleReader
//
//  Created by Gabor Sornyei on 2020. 02. 15..
//  Copyright © 2020. Gabor Sornyei. All rights reserved.
//

import SwiftUI

struct ChapterNumberView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    var viewModel: BibleViewModel
    var book: Book {
        return viewModel.book
    }
    var chapters: Int {
        return book.chapters
    }
    let cols = 6
    var rows: Int {
        return chapters / cols + 1
    }
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Color("LightGray")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Fejezetek")
                        .font(.secondaryTitle)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack {
                                InitialView(char: self.book.abbreviation, color: Color(self.book.covenant == .old ? "Green" : "Red"), size: 44)
                                Text(self.book.name)
                                    .font(.secondaryTitle)
                            }
                            .padding()
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(0..<self.rows, id:\.self) { row in
                                    HStack {
                                        ForEach(1..<self.cols + 1, id:\.self) { col in
                                            Group {
                                                if row * self.cols + col <= self.chapters {
                                                    Button(action: {
                                                        self.viewModel.chapter = row * self.cols + col
                                                        self.presentationMode.wrappedValue.dismiss()
                                                        self.selectedTab = 1
                                                    }) {
                                                        BookButton(text: "\(row * self.cols + col)", width: geo.size.width, color: Color(self.book.covenant == .old ? "Green" : "Red"))
                                                    }
                                                    
                                                } else {
                                                    EmptyView()
                                                }
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            Spacer()
                        }
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                .padding(.top, 10)
            }
            
        }
    }
}



//struct ChapterNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChapterNumberView(book: Biblia_RUF.books[40])
//
//    }
//}
