//
//  ProductPOSO.swift
//  Partnerize-Demo
//
//  Created by Valeriy Dyryavyy on 06/12/2018.
//  Copyright © 2018 Performance Horizon Group LTD. All rights reserved.
//

import UIKit

typealias ProductPOSO = Products.Product

struct Products: Decodable {

    struct Product: Decodable, Hashable {
        
        let id: Int?
        let title: String?
        let category: String?
        let info: String?
        let notes: String?
        let price: String?
        let imageURL: URL?
        let shippingDetails: String?
        
        var pubRef: String?
        var adRef: String?
        var country: String?
        var currency: String?
        var conversionRef: String?
        var custRef: String?
        var voucher: String?
        var metadata: [String: String]?        
        var quantity: Int = 0
        
        private enum CodingKeys: String, CodingKey {
            case id
            case title
            case category
            case info
            case notes
            case price
            case imageURL
            case shippingDetails
        }
    }
    
    let products: [Product]?
    // Conversion parameters
    let pubRef: String?
    let adRef: String?
    let country: String?
    let currency: String?
    let conversionRef: String?
    let custRef: String?
    let voucher: String?
    let metadata: [String: String]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try? container.decode([Product].self, forKey: .products)
        self.pubRef = try? container.decode(String.self, forKey: .pubRef)
        self.adRef = try? container.decode(String.self, forKey: .adRef)
        self.country = try? container.decode(String.self, forKey: .country)
        self.currency = try? container.decode(String.self, forKey: .currency)
        self.conversionRef = try? container.decode(String.self, forKey: .conversionRef)
        self.custRef = try? container.decode(String.self, forKey: .custRef)
        self.voucher = try? container.decode(String.self, forKey: .voucher)
        self.metadata = try? Products.decodeMetadata(from: container.superDecoder(forKey: .metadata))
    }
    
    static func decodeMetadata(from decoder: Decoder) throws -> [String: String] {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var result: [String: String] = [:]
        for key in container.allKeys {
            if let string = try? container.decode(String.self, forKey: key) {
                result[key.stringValue] = string
            }
        }
        return result
    }
    
    enum CodingKeys: String, CodingKey {
        // Conversion parameters
        case products
        case pubRef = "pubref"
        case adRef = "adref"
        case country
        case currency
        case conversionRef = "conversion_ref"
        case custRef = "custref"
        case voucher
        case metadata = "meta"
    }
    
    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            self.init(stringValue: "")
            self.intValue = intValue
        }
    }
}

extension Products.Product {
    static func == (lhs: Products.Product, rhs: Products.Product) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.category == rhs.category &&
            lhs.info == rhs.info &&
            lhs.notes == rhs.notes &&
            lhs.price == rhs.price &&
            lhs.imageURL == rhs.imageURL &&
            lhs.shippingDetails == rhs.shippingDetails &&
            lhs.pubRef == rhs.pubRef &&
            lhs.adRef == rhs.adRef &&
            lhs.country == rhs.country &&
            lhs.currency == rhs.currency &&
            lhs.conversionRef == rhs.conversionRef &&
            lhs.custRef == rhs.custRef &&
            lhs.voucher == rhs.voucher
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(category)
        hasher.combine(info)
        hasher.combine(notes)
        hasher.combine(price)
        hasher.combine(imageURL)
        hasher.combine(shippingDetails)
        hasher.combine(pubRef)
        hasher.combine(adRef)
        hasher.combine(country)
        hasher.combine(currency)
        hasher.combine(conversionRef)
        hasher.combine(custRef)
        hasher.combine(voucher)
    }
}

extension ProductPOSO {
    func description() -> String {
        return String(format: Common.Formats.productDescription,
                      title ?? "",
                      price ?? "0.00",
                      currency ?? "GBP")
    }
}
