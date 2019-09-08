"use strict";


//Const URL servidor

/* mis servicios loales
const urlGetEstadoJuegos = "http://localhost/Confe2/ws/get_estado_juegos.php?id_usr=";
const urlGetObjetos = "http://localhost/Confe2/ws/get_objetos.php?id_usr=";
*/

/* servicios hostinger
const urlGetEstadoJuegos = "https://elpatioviveros.com/test/confe_ws/get_estado_juegos.php?id_usr=";
const urlGetObjetos = "https://elpatioviveros.com/test/confe_ws/get_objetos.php?id_usr=";
*/


// servisios IIS Locales
//var urlGetEstadoJuegos = "http://localhost:60874/api/Juego/listaEstadoJuegos/?idUsuario=";
//var urlGetObjetos = "http://localhost:60874/api/Juego/ObtieneObjetos/?idUsuario=";
// Almacena url servisios IIS seviudor
var urlGetEstadoJuegos;
var urlGetObjetos;


$(document).ready(function () {
    console.log("Ready");    
    setup();
});



function setup () {        
    const sexo = sessionStorage.getItem("sexo");
    const idUsuario = sessionStorage.getItem("idUsuario");
    const tipoAvatar = sessionStorage.getItem("tipoAvatar");
    const tipoTraje = sessionStorage.getItem("tipoTraje");
	const apiJuegos = sessionStorage.getItem("apiJuegos");
	
	//Forma cadena para los dos servicios con los que se coencta preload:
	urlGetEstadoJuegos = apiJuegos + "listaEstadoJuegos/?idUsuario=";
	urlGetObjetos = apiJuegos + "ObtieneObjetos/?idUsuario=";
	
	
    
 	

    getJson(urlGetEstadoJuegos + idUsuario, function (data) {
		console.log("estado juegos")
          guardarDatosSesion(data); 	  			  		
            getJson (urlGetObjetos + idUsuario, function (data) { 
              guardarDatosObjetos(data);
              window.location.assign("./modulos/menu/index.html");
            })
     } )

}


function getJson(url, mCallBack ) {  
  fetch( url )
  .then(
    function(response) {
      if (response.status !== 200) {
        console.log('Error:', response.status);
        return;
      }      
      response.json().then(function(data) {               
        mCallBack(data);        
      });
    }
  )
  .catch(function(err) {
    console.log('Fetch Error :-S', err);
  });  
}




function guardarDatosSesion(array) {	
	console.log(array);	
    const limite = array.length;
    for (let index = 0; index < limite; index++) {		
        sessionStorage.setItem( "activo" + array[index].idJuego,   array[index].activo );
        sessionStorage.setItem( "avance" + array[index].idJuego,   array[index].avance );
        sessionStorage.setItem( "terminado" + array[index].idJuego,   array[index].terminando );        
    }        
}



function guardarDatosObjetos(array) {
	
  const limite = array.length;
  for (let index = 0; index < limite; index++) {
      sessionStorage.setItem( "objeto" + array[index].etiqueta,   array[index].activo);           
  }
  console.log( "sandalias:", sessionStorage.getItem("objetoSandalias"));
  
}