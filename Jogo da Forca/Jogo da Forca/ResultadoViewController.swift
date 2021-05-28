//
//  ResultadoViewController.swift
//  Jogo da Forca
//
//  Created by IFPB on 20/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    var resultado: String?
    @IBOutlet weak var lbResultado: UILabel!
    
    @IBAction func voltar(_ sender: Any) {
        let mvc = self.storyboard?.instantiateViewController(identifier: "main_view") as! MainViewController

        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbResultado.text = self.resultado
    }
}
