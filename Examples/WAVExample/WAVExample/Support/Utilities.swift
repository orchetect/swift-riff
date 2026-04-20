//
//  Utilities.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
import UniformTypeIdentifiers

extension NSItemProvider {
    nonisolated(nonsending)
    func loadFileURL() async -> URL? {
        guard let data = try? await loadItem(forTypeIdentifier: UTType.fileURL.identifier) as? Data else {
            print("Can't load data for dropped item."); return nil
        }
        guard let url = URL(dataRepresentation: data, relativeTo: nil) else {
            print("Can't form URL from data for dropped item."); return nil
        }
        return url
    }

    nonisolated(nonsending)
    func loadWAVFileURL() async -> URL? {
        guard let url = await loadFileURL() else { return nil }

        let fileType = UTType(filenameExtension: url.pathExtension)
        guard fileType == .wav else {
            print("File type is not a wav file."); return nil
        }

        return url
    }
}
