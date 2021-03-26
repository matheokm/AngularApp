import { Component, OnInit, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import {PersonaService} from '../../../Servicios/Persona/persona.service';
import {Configuration} from '../../../Config/app.configuration'
import { ToastrService } from 'ngx-toastr'; //libreria de Notificaciones
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog'; //libreria de Pop-Up



@Component({
  selector: 'app-form-elimina-persona',
  templateUrl: './form-elimina-persona.component.html',
  styleUrls: ['./form-elimina-persona.component.less']
})
export class FormEliminaPersonaComponent implements OnInit {

  public frmEliminaPersona: FormGroup;

   //Variables
  public IdPersona: string;
  public Identificacion: string;
  public Nombres: string;
  public Edad: string;

  constructor(public personaService:PersonaService, private toastr: ToastrService, 
              private dialogRef: MatDialogRef<FormEliminaPersonaComponent>, 
              private formBuilder: FormBuilder, @Inject(MAT_DIALOG_DATA) data) 
    { 
      this.IdPersona = data.IdPersona;
      this.Identificacion = data.Identificacion;
      this.Nombres = data.Nombres;
      this.Edad = data.Edad;
    }

  ngOnInit(): void {
    this.InicializarFormEliminar();
  }

  public InicializarFormEliminar() {
    this.frmEliminaPersona = this.formBuilder.group({
      IdPersona: [this.IdPersona, Validators.required],
      Identificacion: [this.Identificacion, Validators.required],
      Nombres: [this.Nombres, Validators.required],
      Edad: [this.Edad, Validators.required]
    });

  }


  public ActualizaPersona() {
    if (this.frmEliminaPersona.valid) {
     this.personaService.ActualizaPersona(this.frmEliminaPersona.value,Configuration.accionEliminar).subscribe((data: any) => {
       if (data.Success) {

         this.toastr.success('El Registro ha sido Eliminado', 'Persona');
         this.ClosePopup();
       } else {
         this.toastr.error(data.Message, 'Error');
       }
     });
   }
   else
   {
     this.toastr.error('Ingrese Información', 'Error');
   }
 }

  //metodo que cierra el Pop-Up
  public ClosePopup() {
    this.dialogRef.close()
  }


}
