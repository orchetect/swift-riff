//
//  RIFFFileChunkID bext.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftRIFFCore

extension RIFFFileChunkID {
    /// Broadcast Extension Chunk ID ("bext").
    ///
    /// - See: https://en.wikipedia.org/wiki/Broadcast_Wave_Format
    public static var wavFile_bext: Self {
        Self(id: "bext")
    }
}
