import UIKit
import CoreData

class NuevoClienteTableViewController: UITableViewController {
    
    @IBOutlet weak var nombresTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!

    @IBOutlet weak var representanteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func guardarCliente(_ sender: UIBarButtonItem) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Cliente", in: managedContext)!
        
        let cliente = NSManagedObject(entity: entity, insertInto: managedContext)
        
        cliente.setValue(nombresTextField.text, forKey: "nombres")
        cliente.setValue(apellidosTextField.text, forKey: "apellidos")
        cliente.setValue(representanteSwitch.isOn, forKey: "representante")
        
        do {
            try managedContext.save()
            
            // cierra el view controller
            dismiss(animated: true, completion: nil)
            
        } catch let error as NSError {
            print("No se puede guardar. \(error), \(error.userInfo)")
        }
        
    }
}
