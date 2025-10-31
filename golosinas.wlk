class Golosina{
  method precio() {}
  method sabor() {}
  method peso() {}
  method esLibreDeGluten() = true
  method mordizco() 
}
class Bombon inherits Golosina{
  
  var peso = 15
  override method precio() { return 5}
  override method sabor() = frutilla
  override method peso() {return peso}
  override method esLibreDeGluten() {return true}
  override method mordizco(){
     peso = ((peso * 0.8) -1).max(0)
  }
}
class Alfajor inherits Golosina{
  var peso = 300
  override method precio() { return 12}
  override method sabor() = chocolate
  override method peso() {return peso}
  override method esLibreDeGluten() {return false}
  override method mordizco(){
     peso = ((peso * 0.8)).max(0)
  }
}
class Caramelo inherits Golosina{
  var peso = 5
  override method precio() { return 1}
  override method sabor() = frutilla
  override method peso() {return peso}
  override method esLibreDeGluten() {return true}
  override method mordizco(){
     peso = (peso -1).max(0)
  }
}
class Chupetin inherits Golosina{
  var peso = 7
  override method precio () {return 2}
  override method sabor() = naranja
  override method esLibreDeGluten() {return true}
  override method mordizco() {
     if (peso >= 2) {
       peso = (peso - peso * 0.1).max(0)
     }
  }
  override method peso() {return peso}
}
class Oblea inherits Golosina{
  var peso = 250
  override method precio() { return 5}
  override method sabor() = vainilla
  override method peso() {return peso}
  override method esLibreDeGluten() {return false}
  override method mordizco() { peso = (peso - if( peso > 70) peso * 0.5 else peso *0.25).max(0)
  }

}
/*#### Chocolatín
El peso inicial es desconocido, lo asigna el usuario. El precio es de $0,50 por cada gramo de peso inicial. No es libre de gluten. Obviamente, su gusto es chocolate.   
Pierde 2 gramos por mordisco.   
**¡Atención!** El precio es según el _peso inicial_, no debe cambiar con los mordiscos. */
class Chocolatin inherits Golosina{
  var pesoInicial
  var peso = pesoInicial

  override method precio() = pesoInicial * 0.5
  override method sabor() = chocolate
  override method peso() = peso
  override method esLibreDeGluten() = false
  override method mordizco() {
    peso = (peso - 2).max(0)
  }
}
/*#### Golosina bañada
Se arma a partir de una _golosina de base_. <br>
El peso inicial es el de la golosina de base más 4 gramos que es lo que pesa el bañado. El precio es el de la golosina de base más 2 pesos. El gusto es el de la golosina de base. 
De la misma manera, es libre de gluten si lo es su golosina base.   
Con cada mordisco se da un mordisco a la golosina de base. Además, en el primer mordisco pierde 2 gramos de
bañado, y en el segundo los otros dos.*/

class GolosinaBanada inherits Golosina{
  var property golosinaBase  = new Bombon()
  const pesobanio = 4
  var peso = golosinaBase.peso() + pesobanio
  var mordiscosTomados = 0

 /* method init() {
    
    peso = golosinaBase.peso() + pesobanio
  }*/

 override method precio() = golosinaBase.precio() + 2
  override method sabor() = golosinaBase.sabor()
  override method peso() = peso
  override method esLibreDeGluten() = golosinaBase.esLibreDeGluten()

  override method mordizco() {
    golosinaBase.mordizco()
    if (mordiscosTomados < 2) {
      peso = (peso -2)
      mordiscosTomados += 1
    }else{
      peso = peso / 2 
    }
    
  }
}
/* #### Pastilla tutti-frutti
Pesa inicialmente 5 gramos. 
La pastilla puede ser libre de gluten o no (se configura). Si es libre de gluten el precio es $7; si no, es de $10.  
En cada mordisco cambia el sabor, pasa de frutilla a chocolate, de ahí a naranja, de ahí vuelve a frutilla. */
class PastillaTuttiFrutti inherits Golosina{
  var peso = 5
  var libreDeGluten = true
  var indiceSaborActual = 0
  const sabores = [frutilla, chocolate, naranja]

  method configurarLibreDeGluten(valor) {
    libreDeGluten = valor
  }

  override method precio() = if (libreDeGluten) 7 else 10
  override method sabor() = sabores.get(indiceSaborActual)
  override method peso() = peso
  override method esLibreDeGluten() = libreDeGluten

  override method mordizco() {
    indiceSaborActual = (indiceSaborActual + 1) % sabores.size()
    peso = (peso - 1).max(0)
  }
}
object frutilla{
    
  }
object chocolate{
    
  }
object naranja{

}
object vainilla{

}  
