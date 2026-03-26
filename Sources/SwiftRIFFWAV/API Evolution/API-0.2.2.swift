//
//  API-0.2.2.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2025-2025 Steffan Andrews • Licensed under MIT License
//

import struct Foundation.Data
import class Foundation.FileHandle
import SwiftDataParsing

extension WAVFile.BroadcastExtensionChunk.Metadata {
    @_documentation(visibility: internal)
    @_disfavoredOverload
    @available(*, deprecated, renamed: "init(data:byteOrder:)")
    public init(data: Data, endianness: ByteOrder) throws(WAVFileReadError) {
        try self.init(data: data, byteOrder: endianness)
    }
    
    @_documentation(visibility: internal)
    @_disfavoredOverload
    @available(*, deprecated, renamed: "data(endianness:)")
    public func data(endianness: ByteOrder) -> Data {
        data(byteOrder: endianness)
    }
}
