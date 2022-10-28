//
//  AgregarContactoController.swift
//  Practica-contactos
//
//  Created by Alumno on 26/10/22.
//  Copyright © 2022 Sebastian Encinas. All rights reserved.
//

import UIKit

class AgregarContactoController: UIViewController {
    
    var Contacto : contactos?
    
    var callBackAgregarContacto : ((contactos) -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtNumero: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func doTapAgregar(_ sender: Any) {
        if callBackAgregarContacto != nil {
            Contacto = contactos(nombre: txtNombre.text ?? "nombre", numero: txtNumero.text ?? "numero")
            callBackAgregarContacto!(Contacto!)
            self.navigationController?.popViewController(animated: true)
        
        }
    }
    
    
}
