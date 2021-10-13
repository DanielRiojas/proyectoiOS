//
//  ViewControllerOlvidarContrasena.swift
//  ProyectoTEC
//
//  Created by user197925 on 10/11/21.
//

import UIKit

class ViewControllerOlvidarContrasena: UIViewController {

    
    @IBOutlet weak var tf_nombre: UITextField! // TextFields
    @IBOutlet weak var tf_apellidoPaterno: UITextField!
    @IBOutlet weak var tf_apellidoMaterno: UITextField!
    @IBOutlet weak var tf_fechaNacimiento: UITextField!
    @IBOutlet weak var tf_correo: UITextField!
    
    @IBOutlet weak var verificaDatos: UIButton! // Buttons
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Button Configuration
        verificaDatos.layer.cornerRadius = 25
        
        // Tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Eliminate Keyboard
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    

    
    // MARK: - Prepare for segue
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tf_nombre.text! == "" || tf_apellidoPaterno.text! == "" || tf_apellidoMaterno.text! == "" || tf_fechaNacimiento.text! == "" || tf_correo.text! == "" {
            let alerta = UIAlertController(title: "Error", message: "Coloca datos en todos los campos", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            return false
        }
        else {
            return true
        }
    }

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (sender as! UIButton) == verificaDatos {
             let vistaCambiarContrasena = segue.destination as! ViewControllerCambiarContrasena
             vistaCambiarContrasena.correo = tf_correo.text!
             
         }
     }

}
