//
//  ViewController.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/1/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFieldm styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import UIKit

class SpyAppViewController:
    UIViewController  {

    @IBOutlet weak var copyText: copyTextStyle!
    @IBOutlet weak var EncodedText: trial!
    
    // Input and Output sources
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    
    //Labels
    let pasteboard = UIPasteboard.general
    
    //Connecting al ciphers to CipherFactory
    let factory = CipherFactory()
    var cipher: Cipher?
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }*/
    
    //Encoded button Functionality
    @IBAction func encodedButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        
        if let cipher = cipher{
            output.text = cipher.encode(plaintext, secret: secret)
        }else{
            output.text = "No Cipher Selected!"
        }
    }
    
    //Output button Functionality
    @IBAction func print(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        
        if let cipher = cipher{
        output.text = cipher.decrypt(plaintext, secret: secret)
        }else{
            output.text = "No Cipher Selected!"
        }
    }
    
    //Cipher button Functionality
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
           let buttonLable = sender.titleLabel,
           let buttonText = buttonLable.text
         else {
            output.text = "No button or no button text"
            return
         }
                cipher = factory.cipher(for: buttonText)
    }
    
    //Alphanumeric button Functionality
    @IBAction func Alphanumeric(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    //Symbolic Cipher button Functionality
    @IBAction func SymbolicButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    //Extended Character button Functionality
    @IBAction func ExtendedCharactersButtonPressed(_ sender: UIButton){
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    //Copy button Functionality
    @IBAction func copyButtonPressed(_ sender: UIButton) {
        let word = output.text
        pasteboard.string = word
    }
}

// Class for Copy Button Style
class copyTextStyle: UIButton{
    override func didMoveToWindow() {
        self.backgroundColor = UIColor.orange
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
// Class for encoded Button Style
class encodedB: UIButton{
    override func didMoveToWindow() {
        self.backgroundColor = UIColor.green
        self.layer.cornerRadius = self.frame.height / 3
        self.setTitleColor(UIColor.blue, for: .normal)
        self.layer.shadowColor = UIColor.green.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

// Class for decrypt Button Style
class decryptB: UIButton{
    override func didMoveToWindow() {
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = self.frame.height / 3
        self.setTitleColor(UIColor.blue, for: .normal)
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

// Class for ciphers Button Style
class ciphersB: UIButton{
    override func didMoveToWindow() {
        self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = self.frame.height / 3
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
/*
// Class for output Button Style
class output: UITextField{
    override func didMoveToWindow() {
        let t = UITextField()
        //t.frame = CGRect(x: 10, y: 20, width: self.view.frame.width - 20, height: 40)
        t.layer.cornerRadius = 5
        t.layer.borderColor = UIColor.lightGray.cgColor
        t.layer.borderWidth = 1
        t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.leftViewMode = .always
        t.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: t.frame.height))
        t.rightViewMode = .always
        t.clearButtonMode = .whileEditing
        //self.view.addSubview(t)
    }
}*/

// Class for output Button Style
class trial: UILabel{
    override func didMoveToWindow() {
        
        let myColor = UIColor.white
        self.layer.borderColor = myColor.cgColor
        self.layer.borderWidth = 2.0
    }
}

