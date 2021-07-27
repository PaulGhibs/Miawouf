//
//  CatSucessViewController.swift
//  Miawouf
//
//  Created by Paul Ghibeaux on 22/07/2021.
//

import UIKit

class CatSucessViewController: UIViewController {

    var cat: Pet!
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
    }

    private func setTextLabel() {
        if let name = cat.name {
            label.text = """
              😸 🎉 😸 🎉 😸
            Wouf de bienvenue Ã  \(name) !

            Vous avez bien été ajouté à notre base de donnÃ©e ! Nous vous enverrons un SMS dès que nous avons une àme soeur à vous proposer !
            """
        }
    }
    

}
