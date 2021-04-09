import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import {PersonaService} from '../../../Servicios/Persona/persona.service';
import {Configuration} from '../../../Config/app.configuration'
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-formcrear-persona',
  templateUrl: './formcrear-persona.component.html',
  styleUrls: ['./formcrear-persona.component.less']
})
export class FormcrearPersonaComponent implements OnInit {
  public frmActualizaPersona: FormGroup;
  constructor( private formBuilder: FormBuilder, public personaService:PersonaService, 
    private toastr: ToastrService, private dialogRef: MatDialogRef<FormcrearPersonaComponent> ){ }

  ngOnInit(): void {
    this.InicializarFormActualizar();
  }

  public InicializarFormActualizar() {
    this.frmActualizaPersona = this.formBuilder.group({
      Identificacion: [null, 
                            Validators.compose([
                                Validators.required,
                                Validators.pattern("^[0-9]*$"),
                                Validators.minLength(10)                              
                            ])        
                      ],
      Nombres: [null, Validators.required],
      Edad: [null, Validators.required]
    });
  }

  public ActualizaPersona() {
    console.log('console',this.frmActualizaPersona)
    if (this.frmActualizaPersona.valid) {
      this.personaService.ActualizaPersona(this.frmActualizaPersona.value,Configuration.accionInsertar).subscribe((data: any) => {
        if (data.Success) {
          this.toastr.success('Persona', 'Creación Exitosa');
          this.ClosePopup();
        } else {
           if (data.Message.index("PRIMARY KEY") ) this.toastr.error(data.Message, 'Error');
        }
      });
    }
    else
    {
      this.toastr.error('Ingrese Información', 'Error');
    }
  }

  public ClosePopup() {
    this.dialogRef.close()
  }
  
  onFocusOutEvent(event: any){

    console.log(event.target.value);
    //if (event.target.value.toString() == "100")
    //  this.toastr.error('Cedula No Válida', 'Error');
   this.validarCedula( event.target.value.toString());
   this.frmActualizaPersona.controls.Identificacion.setValue("");
    
 }

 get f(){
  return this.frmActualizaPersona.controls;
 }

 public validarCedula( cedula: string)
 {
     //Preguntamos si la cedula consta de 10 digitos
     if(cedula.length == 10){
        
      //Obtenemos el digito de la region que sonlos dos primeros digitos
      var digito_region = parseInt(cedula.substring(0,2));
      
      //Pregunto si la region existe ecuador se divide en 24 regiones
      if( digito_region >= 1 && digito_region <=24 ){
        
        // Extraigo el ultimo digito
        var ultimo_digito   = cedula.substring(9,10);

        //Agrupo todos los pares y los sumo
        var pares = parseInt(cedula.substring(1,2)) + parseInt(cedula.substring(3,4)) + parseInt(cedula.substring(5,6)) + parseInt(cedula.substring(7,8));

        //Agrupo los impares, los multiplico por un factor de 2, si la resultante es > que 9 le restamos el 9 a la resultante
        var numero1 = parseInt(cedula.substring(0,1));
        var numero1 = (numero1 * 2);
        if( numero1 > 9 ){ var numero1 = (numero1 - 9); }

        var numero3 = parseInt(cedula.substring(2,3));
        var numero3 = (numero3 * 2);
        if( numero3 > 9 ){ var numero3 = (numero3 - 9); }

        var numero5 = parseInt(cedula.substring(4,5));
        var numero5 = (numero5 * 2);
        if( numero5 > 9 ){ var numero5 = (numero5 - 9); }

        var numero7 = parseInt(cedula.substring(6,7));
        var numero7 = (numero7 * 2);
        if( numero7 > 9 ){ var numero7 = (numero7 - 9); }

        var numero9 = parseInt(cedula.substring(8,9));
        var numero9 = (numero9 * 2);
        if( numero9 > 9 ){ var numero9 = (numero9 - 9); }

        var impares = numero1 + numero3 + numero5 + numero7 + numero9;

        //Suma total
        var suma_total = (pares + impares);

        //extraemos el primero digito
        var primer_digito_suma = String(suma_total).substring(0,1);

        //Obtenemos la decena inmediata
        var decena = (parseInt(primer_digito_suma) + 1)  * 10;

        //Obtenemos la resta de la decena inmediata - la suma_total esto nos da el digito validador
        var digito_validador = decena - suma_total;

        //Si el digito validador es = a 10 toma el valor de 0
        if(digito_validador == 10)
          var digito_validador = 0;

        //Validamos que el digito validador sea igual al de la cedula
        if(digito_validador == parseInt(ultimo_digito) ){
          //console.log('la cedula:' + cedula + ' es correcta');
          this.toastr.success('La cedula:' + cedula + ' es correcta', 'Correcto');
        }else{
          this.toastr.error('La cedula:' + cedula + ' NO es correcta', 'InCorrecto');
        }
        
      }else{
        // imprimimos en consola si la region no pertenece
        //console.log('Esta cedula no pertenece a ninguna region');
        this.toastr.error('Esta cedula no pertenece a ninguna region', 'InCorrecto');
      }
   }else{
      //imprimimos en consola si la cedula tiene mas o menos de 10 digitos
      //console.log('Esta cedula tiene menos de 10 Digitos');
      this.toastr.error('Esta cedula debe tener 10 Digitos Numericos', 'InCorrecto');
   } 

 }



}

