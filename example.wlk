class Bombon{
  
  var peso = 15
  method precio() { return 5}
  method sabor() = frutilla
  method peso() {return peso}
  method esLibreDeGluten() {return true}
  method mordizco(){
     peso = ((peso * 0.8) -1).max(0)
  }
}
class Alfajor{
  var peso = 300
  method precio() { return 12}
  method sabor() = chocolate
  method peso() {return peso}
  method esLibreDeGluten() {return false}
  method mordizco(){
     peso = ((peso * 0.8)).max(0)
  }
}
class Caramelo{
  var peso = 5
  method precio() { return 1}
  method sabor() = frutilla
  method peso() {return peso}
  method esLibreDeGluten() {return true}
  method mordizco(){
     peso = (peso -1).max(0)
  }
}
class Chupetin{
  var peso = 7
  method precio () {return 2}
  method sabor() = naranja
  method esLibreDeGluten() {return true}
  method mordizco() {
     if (peso >= 2) {
       peso = (peso - peso * 0.1).max(0)
     }
  }
  method peso() {return peso}
}
class Oblea{
  var peso = 250
  method precio() { return 5}
  method sabor() = vainilla
  method peso() {return peso}
  method esLibreDeGluten() {return false}
  method mordizco() { peso = (peso - if( peso > 70) peso * 0.5 else peso *0.25).max(0)
  }

}
/*#### Chocolatín
El peso inicial es desconocido, lo asigna el usuario. El precio es de $0,50 por cada gramo de peso inicial. No es libre de gluten. Obviamente, su gusto es chocolate.   
Pierde 2 gramos por mordisco.   
**¡Atención!** El precio es según el _peso inicial_, no debe cambiar con los mordiscos. */
class Chocolatin {
  var pesoInicial
  var peso = pesoInicial
   
  method precio() = pesoInicial * 0.5
  method sabor() = chocolate
  method peso() = peso
  method esLibreDeGluten() = false
  method mordizco() {
    peso = (peso - 2).max(0)
  }
}
/*#### Golosina bañada
Se arma a partir de una _golosina de base_. <br>
El peso inicial es el de la golosina de base más 4 gramos que es lo que pesa el bañado. El precio es el de la golosina de base más 2 pesos. El gusto es el de la golosina de base. 
De la misma manera, es libre de gluten si lo es su golosina base.   
Con cada mordisco se da un mordisco a la golosina de base. Además, en el primer mordisco pierde 2 gramos de
bañado, y en el segundo los otros dos.*/

class GolosinaBanada {
  var property golosinaBase  = new Bombon()
  const pesobanio = 4
  var peso = golosinaBase.peso() + pesobanio
  var mordiscosTomados = 0

 /* method init() {
    
    peso = golosinaBase.peso() + pesobanio
  }*/

  method precio() = golosinaBase.precio() + 2
  method sabor() = golosinaBase.sabor()
  method peso() = peso
  method esLibreDeGluten() = golosinaBase.esLibreDeGluten()

  method mordizco() {
    golosinaBase.mordizco()
    if (mordiscosTomados < 2) {
      peso = (peso -2)
      mordiscosTomados += 1
    }else{
      peso = peso / 2 
    }
    
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
