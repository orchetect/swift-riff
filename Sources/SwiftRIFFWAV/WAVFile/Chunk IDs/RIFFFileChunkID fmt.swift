//
//  RIFFFileChunkID fmt.swift
//  SwiftRIFF • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftRIFFCore

extension RIFFFileChunkID {
    /// WAV file fmt chunk ID ("fmt ").
    public static var wavFile_fmt: Self {
        Self(id: "fmt ")
    }
}
