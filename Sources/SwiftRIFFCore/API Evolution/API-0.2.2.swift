//
//  API-0.2.2.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2025-2025 Steffan Andrews • Licensed under MIT License
//

import class Foundation.FileHandle
import SwiftDataParsing

extension RIFFFileChunk {
    @_documentation(visibility: internal)
    @_disfavoredOverload
    @available(*, deprecated, renamed: "init(handle:byteOrder:additionalChunkTypes:)")
    public init(
        handle: FileHandle,
        endianness: ByteOrder,
        additionalChunkTypes: RIFFFileChunkTypes
    ) throws(RIFFFileReadError) {
        try self.init(handle: handle, byteOrder: endianness, additionalChunkTypes: additionalChunkTypes)
    }
}

extension FileHandle {
    @_documentation(visibility: internal)
    @_disfavoredOverload
    @available(*, deprecated, renamed: "parseRIFFChunkDescriptor(byteOrder:)")
    public func parseRIFFChunkDescriptor(
        endianness: ByteOrder
    ) throws(RIFFFileReadError) -> RIFFChunkDescriptor {
        try parseRIFFChunkDescriptor(byteOrder: endianness)
    }
}
