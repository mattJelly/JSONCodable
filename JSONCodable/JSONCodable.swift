//
//  JSONCodable.swift
//  JSONCodable
//
//  Created by Matthew Rees on 28/01/2019.
//  Copyright © 2019 Matt Rees. All rights reserved.
//

import Foundation

protocol JSONDecodable: Decodable {
    static func decodeObject<T: Decodable>(withData data:Data?) -> T?
}

extension JSONDecodable {
    static func decodeObject<T: Decodable>(withData data:Data?) -> T? {

        guard let data = data else {
            return nil
        }

        do {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}

protocol JSONEncodable: Encodable {
    static func encodeObject<T: Encodable>(_ value:T?) -> Data?
}

extension JSONEncodable {
    static func encodeObject<T: Encodable>(_ value:T?) -> Data? {

        guard let value = value else {
            return nil
        }

        do {
            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(value)
        } catch {
            return nil
        }
    }
}

protocol JSONCodable: JSONDecodable, JSONEncodable {}
