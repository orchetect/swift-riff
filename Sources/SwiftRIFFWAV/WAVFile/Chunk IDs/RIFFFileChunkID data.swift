//
//  RIFFFileChunkID data.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftRIFFCore

extension RIFFFileChunkID {
    /// WAV file data chunk ID ("data").
    public static var wavFile_data: Self {
        Self(id: "data")
    }
}
