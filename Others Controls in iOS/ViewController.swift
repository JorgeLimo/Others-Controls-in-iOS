//
//  ViewController.swift
//  Others Controls in iOS
//
//  Created by alumno on 3/21/17.
//  Copyright © 2017 Jorge Limo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var actCargando: UIActivityIndicatorView!
    
    @IBOutlet weak var spUno: UIStepper!
    
    @IBOutlet weak var lbltexto: UILabel!

    @IBOutlet weak var brProgresView: UIProgressView!
    
    @IBOutlet weak var dpkFecha: UIDatePicker!
    
    @IBOutlet weak var lblfecha: UILabel!
    
    @IBOutlet weak var pvlistas: UIPickerView!
    
    var opciones = Array<String>()
    
    @IBOutlet weak var btnIniciar: UIButton!
    
    @IBOutlet weak var vwContenido: UIView!
    
    @IBOutlet weak var scrContenedor: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        let resultado =  dateFormater.string(from: dpkFecha.date)
        lblfecha.text = resultado
        
        
        
        for i in 0...8{
            opciones.append("Opcion \(i)")
        }
        scrContenedor.contentSize = vwContenido.frame.size
        
        
        scrContenedor.addSubview(vwContenido)
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionStepper(_ sender: UIStepper) {
        
        lblfecha.text = String(describing: dpkFecha.date)
        
          lbltexto.text = String(sender.value)
        
        brProgresView.progress = Float(sender.value)/Float(sender.maximumValue)
        let dataProgress = brProgresView.progress
        
        if (dataProgress < 0.3) {
            brProgresView.progressTintColor = UIColor.red
        }else if(dataProgress >= 0.3 && dataProgress < 0.8){
            brProgresView.progressTintColor = UIColor.yellow
        }else{
            brProgresView.progressTintColor = UIColor.green
        }
        
        if (dataProgress > 0.0 && dataProgress < 1.0) {
            actCargando.isHidden = true
        }else{
            actCargando.isHidden = false
            
        }
        
        
    }

    
    @IBAction func CambiarFecha(_ sender: UIDatePicker) {
        
    //lblfecha.text = String(describing: sender.date)
        let dateFormater = DateFormatter()
        
        dateFormater.dateFormat = "dd/mm/yyyy"
    
        let resultado =  dateFormater.string(from: sender.date)
        lblfecha.text = resultado
    }
    
    
    @IBAction func btnActionInciar(_ sender: UIButton) {
        
        let hilo = DispatchQueue(label: "pe.ourlimm.Others-Controls-in-iOS")
       
        /**
         
         al cargar dos procesos asincronos se tratan de ejecutar al mismo tiempo
         
        let hilo2 = DispatchQueue(label: "pe.ourlimm.Others-Controls-in-iOSPesada")
        
        hilo.async {
            for i in 0...100{
                print("A \(i)")
            }
        }
        
        hilo2.async {
            for i in 0...100{
                print("b \(i)")
            }
         
        }
         
         
         este metodo trabja sincrona y espera qe termine la tarea para segui trabajando
         en el app 
         
         hilo.sync {
         for i in 0...100{
         print("b \(i)")
         }
         
         }
         **/
        

        hilo.async {
            for i in 0...100000{
                //si la tarea es mucho, se debe hacer en segundo
                //plano
                print(i)
                let progreso = (Float(i)/100000.0)
                self.brProgresView.progress = progreso
            }
        }
    
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return opciones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opciones[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(opciones[row])
    }
    
    
    @IBAction func actionRegresar(_ sender: UIBarButtonItem) {
        
        print("")
        
    }
    
    

}

