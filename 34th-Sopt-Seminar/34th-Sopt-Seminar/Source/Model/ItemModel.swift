//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 류희재 on 3/29/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "rla", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "f", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재f", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희ff재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .logo2, name: "류희재", price: "22000원", heartIsSelected: false)
        ]
    }
}

