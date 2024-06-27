//
//  CodeDescriptionView.swift
//  HTTPCodes
//
//  Created by Sergey Dolgikh on 27.06.2024.
//

import SwiftUI

struct CodeDescriptionView: View {
    let status: ResponseStatus
    var memeImage: Image {
        Image(String(status.code) + "-meme")
    }
    var image: Image {
        Image(String(status.code))
    }
    
    var body: some View {
        Form {
            Section {
                Text(status.description)
            } header: {
                VStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Text(status.name)
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .navigationTitle(String(status.code))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(
                    item: memeImage,
                    preview: SharePreview(String(status.code) + " - " + status.name, image: image)
                )
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        CodeDescriptionView(status: Category.informationalResponses.codes[0])
    }
}
