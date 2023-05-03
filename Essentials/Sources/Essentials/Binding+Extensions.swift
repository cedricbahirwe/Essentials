//
//  File.swift
//  
//
//  Created by Cédric Bahirwe on 03/05/2023.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Binding where Value == String? {
    var optionalBind: Binding<String> {
        .init(
            get: {
                wrappedValue ?? ""
            }, set: {
                wrappedValue = $0
            }
        )
    }
}

@available(iOS 13.0, *)
public extension Binding where Value: ExpressibleByNilLiteral {
    var optionalBind: Binding<Value> {
        .init(
            get: {
                wrappedValue
            }, set: {
                wrappedValue = $0
            }
        )
    }
}

