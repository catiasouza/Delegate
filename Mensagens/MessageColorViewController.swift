//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
    }
    
    //PASSAR P OUTRA TELA COM AS INFORMACOES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }
    
    
    
    override func changeColor(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let colorPicker = storyboard?.instantiateViewController(identifier: "ColorPickerViewController") as! ColorPickerViewController
            //TELA C ALPHA DEFINIDO FICA POR CIMA DA OUTRA
            colorPicker.modalPresentationStyle = .overCurrentContext
            colorPicker.delegate = self
            present(colorPicker,animated: true,completion: nil)
        } else {
            
        }
    }
}
extension MessageColorViewController: ColorPickerDelegate{
    func applyColor(color: UIColor){
        lbMessage.textColor = color
        message.textColor = color
    }
}
