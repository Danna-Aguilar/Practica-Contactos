//
//  ViewController.swift
//  Practica-contactos
//
//  Created by Alumno on 24/10/22.
//  Copyright © 2022 Sebastian Encinas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tvContactos: UITableView!
    
    
    var Contactos:[contactos] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        Contactos.append(contactos(nombre: "Azalia", numero: "6441758292"))
        Contactos.append(contactos(nombre: "Marisela", numero: "6441875201"))
        Contactos.append(contactos(nombre: "Armando", numero: "6442501718"))

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contactos.count
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "Celdacontacto") as?CeldaContactoController
        celda?.lblNombre.text = Contactos[indexPath.row].nombre
        celda?.lblNumero.text = Contactos[indexPath.row].numero
        
        return celda!
    }
    
    //@IBAction func btAgregar(_ sender: Any) {
      //  performSegue(withIdentifier: "toGoAgregar", sender: self)
        //callBackAgregarContacto = AgregarContacto
        
    //}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toGoAgregar" {
            let destino = segue.destination as! AgregarContactoController
            destino.callBackAgregarContacto = AgregarContacto
        }
        
        if segue.identifier == "toGoEditar" {
            let destino = segue.destination as! EditarContactoController
            destino.Contacto = Contactos[tvContactos.indexPathForSelectedRow!.row]
            destino.callBackEditarContacto = EditarContacto
        }
        
    }
    func AgregarContacto(Contacto: contactos){
        Contactos.append(Contacto)
        tvContactos.reloadData()
    }
    func EditarContacto(Contacto: contactos){
        tvContactos.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    
    
    
    
    
    
    
    
    
}




