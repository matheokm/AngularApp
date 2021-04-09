import { Component, OnInit,Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { PersonaService } from '../../../Servicios/Persona/persona.service';
import { Configuration } from '../../../Config/app.configuration';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-form-actualiza-persona',
  templateUrl: './form-actualiza-persona.component.html',
  styleUrls: ['./form-actualiza-persona.component.less']
})
export class FormActualizaPersonaComponent implements OnInit {
  public frmActualizaPersona: FormGroup;
  public IdPersona: string;
  public Identificacion: string;
  public Nombres: string;
  public Edad: string;

  constructor(private formBuilder: FormBuilder,
    @Inject(MAT_DIALOG_DATA) data,
     public personaService : PersonaService,
     private toastr: ToastrService,
     private dialogRef: MatDialogRef<FormActualizaPersonaComponent>,) 
    {
      this.IdPersona = data.IdPersona;
      this.Identificacion = data.Identificacion;
      this.Nombres = data.Nombres;
      this.Edad = data.Edad;
     }

  ngOnInit(): void {
    
    this.InicializarFormActualizar();
  }

  public InicializarFormActualizar( ) {
    this.frmActualizaPersona = this.formBuilder.group({
      IdPersona: [this.IdPersona, Validators.required],
      Identificacion: [this.Identificacion, Validators.required],
      Nombres: [this.Nombres, Validators.required],
      Edad: [this.Edad, Validators.required],
    });
    }


    public ActualizaPersona() {

      if (this.frmActualizaPersona.valid) {
        this.personaService.ActualizaPersona(this.frmActualizaPersona.value, Configuration.accionActualizar).subscribe((data: any) => {
          if (data.Success) {
  
            this.toastr.success('El Registro ha sido Actualizado', 'Persona');
            this.ClosePopup();
          } else {
            this.toastr.error(data.Message, 'Error');
          }
        });
      }
      else {
        this.toastr.error('Ingrese Información', 'Error');
      }
    }
  
    ClosePopup() {

      this.dialogRef.close();
    }
}
