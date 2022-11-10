//
//  Controller.swift
//  HomeWork.MVC
//
//  Created by zalkarbek on 9/11/22.
//

import Foundation
import UIKit

class Controller {
    private weak var view: ViewController?
    private var model: Model!
    
    
    init(view: ViewController) {
        self.view = view
        self.model = Model(controller: self)
    }
    
    func setToModel(user: String, pass: String) {
        model.proverka(user: user, pass: pass)
    }
    
    func getFromModel() -> [String: String] {
        model.test()
       
    }
    
    
}


class LocalStore {
    
    static var shared = LocalStore()
    var users: [String: String] = ["Argen": "24", "Baisal": "25", "Jamila": "27"]
    private init() {}
}
