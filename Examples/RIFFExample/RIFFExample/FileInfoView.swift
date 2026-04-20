//
//  FileInfoView.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftRadix
import SwiftRIFFCore
import SwiftUI

struct FileInfoView: View {
    let file: RIFFFile
    @State private var items: [ChunkItem] = []
    @State private var selection: ChunkItem?

    var body: some View {
        VStack(spacing: 20) {
            Text(file.url?.path ?? "-")
                .truncationMode(.middle)

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    List(items, children: \.subitems, selection: $selection) { item in
                        Text("🏷️ \(item.chunk.id.id)")
                            .tag(item)
                    }
                    .listStyle(.sidebar)
                }
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 300)

                VStack {
                    if let selection {
                        ChunkInfoView(url: file.url, chunk: selection.chunk)
                    } else {
                        BlankView(label: "Select a chunk to view its details.", systemImage: "tag")
                    }
                }
                .padding([.leading, .trailing])
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            updateItems(from: file)
        }
        .onChange(of: file) { newValue in
            updateItems(from: newValue)
        }
    }
}

extension FileInfoView {
    private func updateItems(from file: RIFFFile) {
        items = file.chunks.map(ChunkItem.init)
        selection = items.first
    }
}
