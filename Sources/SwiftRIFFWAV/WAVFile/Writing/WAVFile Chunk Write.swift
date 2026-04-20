//
//  WAVFile Chunk Write.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import struct Foundation.Data
import SwiftRIFFCore

extension WAVFile {
    /// Overwrites the format chunk ("fmt ") in the wav file on disk with new data.
    /// Throws an error if there was a problem writing the data.
    public func write(format: FMTChunk.Metadata) throws {
        guard let chunk = try self.format() else {
            throw WAVFileReadError.missingFormatChunk
        }
        let newData = format.data(byteOrder: riffFile.riffFormat.byteOrder)
        try riffFile.write(chunk: chunk, data: newData)
    }
}

extension WAVFile {
    /// Overwrites the data chunk ("data") in the wav file on disk with new data.
    /// The data size must be identical to the existing "data" chunk data in the wav file.
    /// Throws an error if there was a problem writing the data or if the size mismatches.
    public func write(data: Data) throws {
        guard let chunk = try self.data() else {
            throw WAVFileReadError.missingDataChunk
        }
        try riffFile.write(chunk: chunk, data: data)
    }
}

extension WAVFile {
    /// Overwrites the BWAV extension chunk ("bext") in the wav file on disk with new data.
    /// Throws an error if there was a problem writing the data.
    public func write(bext: BroadcastExtensionChunk.Metadata) throws {
        guard let chunk = try self.bext() else {
            throw WAVFileReadError.missingFormatChunk
        }
        let newData = bext.data(byteOrder: riffFile.riffFormat.byteOrder)
        try riffFile.write(chunk: chunk, data: newData)
    }
}
