import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import{HolaMundoComponent} from './Formularios/hola-mundo/hola-mundo.component' // IMPORTAR EL COMPONENTE GENERADO
import{FormPersonaComponent} from'./Formularios/form-persona/form-persona.component'
import{FormcrearPersonaComponent} from'./Formularios/form-persona/formcrear-persona/formcrear-persona.component'

const routes: Routes = [
  { path:'',component:HolaMundoComponent}, // AGREGAR EL COMPONENTE AL ROUTING DE ANGULAR, '' EN VACIO PARA TOMAR LA RUTA POR DEFAULTS
  { path:'Persona',component:FormPersonaComponent},
  { path:'CrearPersona',component:FormcrearPersonaComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
