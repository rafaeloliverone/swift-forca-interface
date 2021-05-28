//
//  ViewController.swift
//  Jogo da Forca
//
//  Created by IFPB on 20/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var palavras = ["palmeiras", "android", "laranja"]
    var dicas = ["Time sem mundial", "Sou um sistema operacional", "Sou uma cor"]
    var random: Int?
    @IBOutlet weak var lbQuantidadeLetras: UILabel!
    @IBOutlet weak var lbDica: UILabel!
    
    @IBOutlet weak var lbLetrasJogadas: UILabel!
    
    @IBOutlet weak var lbTentativas: UILabel!
    
    @IBOutlet weak var lbStatus: UILabel!
    
    @IBOutlet weak var tfLetra: UITextField!
    var forca: Forca!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func jogar(_ sender: Any) {
        let letra = Character(self.tfLetra.text!)
        self.forca.jogar(letra: letra)
        self.atualizar()
        
        if(self.forca.terminou()) {
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultadoViewController
            rvc.resultado = self.forca.resultado()
            self.present(rvc, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
        self.random = Int.random(in: 0..<3)
        print("view will load")
        self.forca = Forca(palavra: palavras[self.random!], dica: dicas[self.random!])
        self.atualizar()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    
    func atualizar() {
        self.lbDica.text = self.dicas[self.random!]
        self.lbQuantidadeLetras.text = "Quantidade: \(self.forca.palavra.count) letras."
        self.lbLetrasJogadas.text = "Letras jogadas: \(self.forca.letrasJogadas)"
        self.lbTentativas.text = "Tentativas restantes: \(10-self.forca.tentativas)"
        self.lbStatus.text = String(self.forca.status)
        self.imageView.image = UIImage(named: "forca_\(self.forca.tentativas).png")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.atualizar()
        print("da")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("aqq")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("aaaaa")
    }
    
}

