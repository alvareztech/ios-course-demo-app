import UIKit

class RegistroViewController: UIViewController {
    
    var email: String = ""

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad Regitrar")


        // Colocamos el texto (email) enviado desde la pantalla de log in
        emailTextField.text = email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func registrar(_ sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear Regitrar")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear Regitrar")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear Regitrar")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear Regitrar")
    }

}
