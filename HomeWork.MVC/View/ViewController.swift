//
//  ViewController.swift
//  HomeWork.MVC
//
//  Created by zalkarbek on 9/11/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var usertextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Name"
        textfield.backgroundColor = .cyan
        return textfield
    }()
    
    private lazy var oldtextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "your old"
        textfield.backgroundColor = .cyan
        return textfield
    }()
    
    private lazy var getButton: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(Save), for: .touchUpInside)
        return button
    }()
    
    private var controller: Controller?
    private var serviceStore = LocalStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        // Do any additional setup after loading the view.
        Viewshka()
        controller = Controller(view: self)
    }
    
    func Viewshka() {
        view.addSubview(usertextField)
        usertextField.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top).offset(100)
                make.left.equalTo(view.snp.left).offset(50)
                make.width.equalTo(300)
                make.height.equalTo(50)
        }
        
        view.addSubview(oldtextField)
        oldtextField.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(200)
            make.left.equalTo(view.snp.left).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        view.addSubview(getButton)
        getButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(300)
            make.left.equalTo(view.snp.left).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }

    @objc func Save() {
        guard let user = usertextField.text else { return }
        guard let pass = oldtextField.text else { return }
        
        controller?.setToModel(user: user, pass: pass)
        
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
        controller?.getFromModel()
        if serviceStore.users[user] != nil {
            if pass == serviceStore.users[user]! {
                secondViewController.secondUser = user
                secondViewController.secondOld = pass
                secondViewController.navigationItem.title = "You have successfully registered!!!"
                print("succes")
            } else {
                print("wrong")
                secondViewController.secondUser = "You are wrong"
                secondViewController.secondOld = "You are wrong"
                secondViewController.navigationItem.title = "You spelled it wrong!!!"
            }
        } else {
            print("you need to registr")
            secondViewController.secondUser = "You are wrong"
            secondViewController.secondOld = "You are wrong"
            secondViewController.navigationItem.title = "You spelled it wrong!!!"
        }
    }

}

