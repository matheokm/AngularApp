import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HolaMundoComponent } from './Formularios/hola-mundo/hola-mundo.component';
import { FormPersonaComponent } from './Formularios/form-persona/form-persona.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
//importar librerias 
import { MatTableModule } from '@angular/material/table';
import {FormsModule} from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { ToastrModule } from 'ngx-toastr';
import { MatDialogModule } from '@angular/material/dialog';

import { HttpClientModule,HttpClient } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { FormcrearPersonaComponent } from './Formularios/form-persona/formcrear-persona/formcrear-persona.component';
import { FormActualizaPersonaComponent } from './Formularios/form-persona/form-actualiza-persona/form-actualiza-persona.component';
import { FormEliminaPersonaComponent } from './Formularios/form-persona/form-elimina-persona/form-elimina-persona.component';
import {ReactiveFormsModule } from '@angular/forms';
import { OverlayComponent } from './Utilitarios/overlay/overlay.component';
import { MatSelectModule } from '@angular/material/select';

@NgModule({
  declarations: [
    AppComponent,
    HolaMundoComponent,
    FormPersonaComponent,
    FormcrearPersonaComponent,
    FormActualizaPersonaComponent,
    FormEliminaPersonaComponent,
    OverlayComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatTableModule,
    MatInputModule,
    MatButtonModule,
    FormsModule,
    HttpClientModule,
    NgbModule,
    ToastrModule.forRoot(),
    ReactiveFormsModule,
    MatDialogModule,
    MatSelectModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
