//
//  RIFFFileChunkID iXML.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import SwiftRIFFCore

extension RIFFFileChunkID {
    /// Broadcast Wave iXML ID ("iXML").
    ///
    /// - See: https://en.wikipedia.org/wiki/IXML
    /// - See: https://en.wikipedia.org/wiki/Broadcast_Wave_Format
    public static var wavFile_iXML: Self {
        Self(id: "iXML")
    }
}
