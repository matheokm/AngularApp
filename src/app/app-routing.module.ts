import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import{HolaMundoComponent} from './Formularios/hola-mundo/hola-mundo.component' // IMPORTAR EL COMPONENTE GENERADO
import{FormPersonaComponent} from'./Formularios/form-persona/form-persona.component'
import{FormcrearPersonaComponent} from'./Formularios/form-persona/formcrear-persona/formcrear-persona.component'
import{FormChipPersonaComponent} from'./Formularios/form-chip-persona/form-chip-persona.component'

const routes: Routes = [
  { path:'Hola',component:HolaMundoComponent}, // AGREGAR EL COMPONENTE AL ROUTING DE ANGULAR, '' EN VACIO PARA TOMAR LA RUTA POR DEFAULTS
  { path:'Persona',component:FormPersonaComponent},
  { path:'CrearPersona',component:FormcrearPersonaComponent},
  { path:'',component:FormChipPersonaComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
