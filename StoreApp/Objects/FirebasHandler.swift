//
//  FirebasHandler.swift
//  StoreApp
//
//  Created by Гурген on 21.02.2021.
//

import Foundation
import FirebaseDatabase

struct FirebaseHandler {
    private let value: Codable?
    
    init(_ value:Codable? = nil) {
        self.value = value
    }
    
    private var children: [String] = []
    
    private var actualReference: DatabaseReference {
        var ref = Database.database().reference() //  указатель на место в database
        for child in children {
            ref = ref.child(child)
        }
        return ref
    }
    
    func read<T: Codable>(closure: ((T?) -> Void)?) -> FirebaseHandler {
        actualReference.observeSingleEvent(of: .value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let model = try? T.init(from: dict)
                closure?(model)
            } else {
                closure?(nil)
            }
        }
        return self
    }//snapsot стек данный, который пришел с сервера
    
    func to(_ value: String) -> FirebaseHandler {
        var new = self
        new.children.append(value)
        return new
    }//сохраняю продукт в базе несколько раз
    
    func auto() -> FirebaseHandler {
        return to(UUID().uuidString)
    }
    
    func setValue() -> FirebaseHandler{
        let dictionary = value?.dictionary
        actualReference.setValue(dictionary) { (error, reference) in
            
        }
        return self
    }
}

