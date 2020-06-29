//
//  ViewController.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 29/06/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(Environment().configuration(.baseURL))
        
    }


}
