import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ingresar(_ sender: UIButton) {
        
        messageLabel.text = ""
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if !esEmailValido(email: email) {
            messageLabel.text = "Correo electrónico no válido"
            return
        }
        
        if !esPasswordValido(password: password) {
            messageLabel.text = "Contraseña no válida"
            return
        }
        
        // Si llegamos hasta aquí, se cumplieron las validaciones
        
        
        
    }
    
    
    // Función de punto de retorno
    @IBAction func unwindToLogIn(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    // Función para enviar datos al ViewController de Registro mediante su Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navegacion = segue.destination as? UINavigationController {
            if let regitro = navegacion.topViewController as? RegistroViewController {
                regitro.email = emailTextField.text!
            }
        }
    }
    
    // Funciones de validación
    
    func esEmailValido(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    
    
    func esPasswordValido(password: String) -> Bool {
        if password.characters.count >= 8 {
            return true
        }
        return false
    }

}

