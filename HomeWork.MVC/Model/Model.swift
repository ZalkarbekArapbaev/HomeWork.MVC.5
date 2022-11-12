//
//  Model.swift
//  HomeWork.MVC
//
//  Created by zalkarbek on 9/11/22.
//

import Foundation
import UIKit

class Model {
    private weak var controller: Controller?
    private var serviceStore = LocalStore.shared
    
    
    init(controller: Controller) {
        self.controller = controller
    }
    
    
    func proverka(user: String, pass: String) {
        serviceStore.users.updateValue(pass, forKey: user)
        print("Model recievied: \(user) and \(pass)")
    }
    
    func test(user: String, pass: String) -> [String: String] {
        for (username, password) in serviceStore.users {
            if username == user {
                if password == pass {
                    print("in")
                    break
                }
            } else {
                print("wrong")
                break
            }
        }
        return serviceStore.users
    }
    
}
