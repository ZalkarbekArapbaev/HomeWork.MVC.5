//
//  SecondViewController.swift
//  HomeWork.MVC
//
//  Created by zalkarbek on 9/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    private lazy var secondlabelName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var secondlabelOld: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
//    private lazy var testLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .red
//        return label
//    }()
    
    var secondUser = ""
    var secondOld = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationItem.title = "SecondViewController"

        // Do any additional setup after loading the view.
        Viewshka()
        secondlabelName.text = secondUser
        secondlabelOld.text = secondOld
    }
    
    func Viewshka() {
        view.addSubview(secondlabelName)
        secondlabelName.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(200)
            make.left.equalTo(view.snp.left).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(secondlabelOld)
        secondlabelOld.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(300)
            make.left.equalTo(view.snp.left).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }

    
}
