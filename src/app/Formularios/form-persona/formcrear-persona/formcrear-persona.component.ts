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
      Identificacion: [null, Validators.required],
      Nombres: [null, Validators.required],
      Edad: [null]
    });
  }

  public ActualizaPersona() {
    if (this.frmActualizaPersona.valid) {
      this.personaService.ActualizaPersona(this.frmActualizaPersona.value,Configuration.accionInsertar)
      .subscribe((data: any) => {
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
  
}

