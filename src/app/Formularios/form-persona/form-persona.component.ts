import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import { ToastrService } from 'ngx-toastr';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';

// modelos
import {Persona} from '../../Modelos/Persona';
// servicios
import {PersonaService} from '../../Servicios/Persona/persona.service';

import {FormcrearPersonaComponent} from '../form-persona/formcrear-persona/formcrear-persona.component';
import {FormEliminaPersonaComponent} from '../form-persona/form-elimina-persona/form-elimina-persona.component';
import {FormActualizaPersonaComponent} from '../form-persona/form-actualiza-persona/form-actualiza-persona.component';


export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
  {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He'},
  {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li'},
  {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be'},
  {position: 5, name: 'Boron', weight: 10.811, symbol: 'B'},
  {position: 6, name: 'Carbon', weight: 12.0107, symbol: 'C'},
  {position: 7, name: 'Nitrogen', weight: 14.0067, symbol: 'N'},
  {position: 8, name: 'Oxygen', weight: 15.9994, symbol: 'O'},
  {position: 9, name: 'Fluorine', weight: 18.9984, symbol: 'F'},
  {position: 10, name: 'Neon', weight: 20.1797, symbol: 'Ne'},
];
@Component({
  selector: 'app-form-persona',
  templateUrl: './form-persona.component.html',
  styleUrls: ['./form-persona.component.less']
})
export class FormPersonaComponent implements OnInit {
   public overlay: string;
   public lstPersona: Persona[];
   public  listaPersona: any;

  displayedColumns: string[] = ['IdPersona', 'Identificacion', 'Nombres', 'Edad','actions'];

  // dataSource = new MatTableDataSource(ELEMENT_DATA);
  public dataSource = new MatTableDataSource<Persona>();
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  constructor(public personaService : PersonaService,  private toastr: ToastrService,public dialogService: MatDialog) { }

  ngOnInit(): void {
    // this.toastr.success('Formulario Persona','MI PROYECTO');
    // this.toastr.error('Error Formulario Persona','MI PROYECTO');
    // this.toastr.info('Error Formulario Persona','MI PROYECTO');
    this.consultaPersona();
  }

  public consultaPersona() {
    this.overlay = 'active';
    this.personaService.consultaPersona()
    .subscribe(res => {
      console.log('res',res)
      this.dataSource.data = res.Data as Persona[];
      this.overlay = 'deactive';
    })
  }

  public CrearDialog() {
    const dialogConfig = new MatDialogConfig();
      const dialogRef = this.dialogService.open(FormcrearPersonaComponent, dialogConfig);
      dialogRef.afterClosed().subscribe((response: any) => {
        this.ngOnInit();
      });
  }

  EliminaDialog(i: number, IdPersona: string, Identificacion: string,Nombres:string,Edad: any) {
    const dialogConfig = new MatDialogConfig();
       dialogConfig.data = {
        IdPersona: IdPersona,
        Identificacion: Identificacion,
        Nombres: Nombres,
        Edad: Edad
      };
      const dialogRef = this.dialogService.open(FormEliminaPersonaComponent, dialogConfig);
      dialogRef.afterClosed().subscribe((response: any) => {
        this.consultaPersona();
      });
  }

  ActualizaDialog(i: number, IdPersona: string, Identificacion: string,Nombres:string,Edad: any) {
    const dialogConfig = new MatDialogConfig();
       dialogConfig.data = {
        IdPersona: IdPersona,
        Identificacion: Identificacion,
        Nombres: Nombres,
        Edad: Edad
      };
      const dialogRef = this.dialogService.open(FormActualizaPersonaComponent, dialogConfig);
      dialogRef.afterClosed().subscribe((response: any) => {
        this.consultaPersona();
      });
  }
  // public consultaPersona() {
  //   let resultado = this.personaService.consultaPersona();
  //   resultado.subscribe(
  //     (response) => {
  //       this.lstPersona = [];
  //       this.listaPersona = response.Data;

  //       this.listaPersona.forEach(eachEvent => {
  //         let itemPersona: Persona = {
  //           IdPersona :eachEvent.IdPersona,
  //           Identificacion :eachEvent.Identificacion,
  //           Nombres :eachEvent.Nombres,
  //           Edad :eachEvent.Edad
  //         }

  //         this.lstPersona.push(itemPersona);
  //       })
  //       console.log('Listapersona',this.lstPersona);
  //     },
  //     (error) => { console.log("EROR", error); }
  //   );

    
  // }
}
