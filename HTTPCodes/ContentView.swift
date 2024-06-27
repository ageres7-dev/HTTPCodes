//
//  ContentView.swift
//  HTTPCodes
//
//  Created by Sergey Dolgikh on 27.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    private let categories = Category.all
    private var filteredCategories: [Category] {
        filter(sections: categories, query: searchText)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(filteredCategories, id: \.self) { category in
                    
                    Section(category.name) {
                        ForEach(category.codes, id: \.self) { code in
                            NavigationLink(code.codeAndName) {
                                CodeDescriptionView(status: code)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Коды ответов HTTP")
            .searchable(text: $searchText)
        }
    }
}

extension ContentView {
    private func filter(sections: [Category], query: String) -> [Category] {
        guard !query.isEmpty else { return sections }
        
        let filteredList: [Category] = sections.compactMap { section in
            let codes = section.codes.filter {
                $0.codeAndName.localizedCaseInsensitiveContains(query)
            }
            guard !codes.isEmpty else { return nil }
            var filteredSection = section
            filteredSection.codes = codes
            
            return filteredSection
        }
        
        return filteredList
    }
}

#Preview {
    ContentView()
}
