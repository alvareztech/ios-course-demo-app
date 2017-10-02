import UIKit
import CoreData

class ClientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var clientes: [Cliente] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Determina el número de celdas que tendra por sección, en este caso solo una sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientes.count;
    }
    
    // Retorna la celda con los datos colocados por posición
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "clienteCell", for: indexPath)
        
        let persona: Cliente = clientes[indexPath.row]
        
        let nombreLabel : UILabel = cell.viewWithTag(1) as! UILabel
        let ciLabel : UILabel = cell.viewWithTag(2) as! UILabel
        
        nombreLabel.text = persona.nombres
        ciLabel.text = persona.apellidos
        
        return cell
    }
    
    
    // Función de punto de retorno
    @IBAction func unwindToClientes(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTodosLosClientes()
    }
    
    func obtenerTodosLosClientes() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Cliente>(entityName: "Cliente")
        
        do {
            clientes = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("No se puede obtener los datos. \(error), \(error.userInfo)")
        }
    }
    
    func obtenerClientesPorNombre(_ nombre: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let model = managedContext.persistentStoreCoordinator?.managedObjectModel,
            let fetchRequest = model.fetchRequestFromTemplate(withName: "ClientesPorNombre", substitutionVariables: ["abc": nombre]) as? NSFetchRequest<Cliente> else {
                return
        }
        
        do {
            clientes = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("No se puede obtener los datos. \(error), \(error.userInfo)")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchBar: \(searchText)")
        
        if searchText.characters.count > 0 {
            obtenerClientesPorNombre(searchText)
        } else {
            obtenerTodosLosClientes()
        }
    }
    
}
