import UIKit

class ClientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var clientes: [Persona] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let persona1 = Persona(nombre: "Maria", ci: 6112231, teléfono: 77665544, correo: "maria@empresa.com")
        let persona2 = Persona(nombre: "Julio", ci: 31263177, teléfono: 66229944, correo: "julio@empresa.com")
        let persona3 = Persona(nombre: "Katherine", ci: 4123121, teléfono: 77221100, correo: "katherine@empresa.com")
        
        clientes.append(persona1)
        clientes.append(persona2)
        clientes.append(persona3)
        
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
        
        let persona: Persona = clientes[indexPath.row]
        
        let nombreLabel : UILabel = cell.viewWithTag(1) as! UILabel
        let ciLabel : UILabel = cell.viewWithTag(2) as! UILabel
        
        nombreLabel.text = persona.nombre
        ciLabel.text = String(persona.ci)
        
        return cell
    }
    
}
