import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {Component,OnInit, ElementRef, ViewChild} from '@angular/core';
import {FormControl} from '@angular/forms';
import {MatAutocompleteSelectedEvent, MatAutocomplete} from '@angular/material/autocomplete';
import {MatChipInputEvent} from '@angular/material/chips';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';
// modelos
import {Persona} from '../../Modelos/Persona';
// servicios
import {PersonaService} from '../../Servicios/Persona/persona.service';


@Component({
  selector: 'app-form-chip-persona',
  templateUrl: './form-chip-persona.component.html',
  styleUrls: ['./form-chip-persona.component.less']
})
export class FormChipPersonaComponent implements OnInit {

  public overlay: string;
  public lstPersona: Persona[];
  public  listaPersona: any;
   
  // constructor() { }

   ngOnInit(): void {
    this.consultaPersona();
    }

  visible = true;
  selectable = true;
  removable = true;
  separatorKeysCodes: number[] = [ENTER, COMMA];
  fruitCtrl = new FormControl();
  filteredFruits: Observable<string[]>;
  fruits: string[] = [];
  allFruits: string[] = [];


  @ViewChild('fruitInput') fruitInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete: MatAutocomplete;

  constructor(public personaService : PersonaService) {
    this.filteredFruits = this.fruitCtrl.valueChanges.pipe(
        startWith(null),
        map((fruit: string | null) => fruit ? this._filter(fruit) : this.allFruits.slice()));
  }

  add(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    // Add our fruit
    if ((value || '').trim()) {
      this.fruits.push(value.trim());
    }
    

    // Reset the input value
    if (input) {
      input.value = '';
    }

    this.fruitCtrl.setValue(null);
  }

  remove(fruit: string): void {
    const index = this.fruits.indexOf(fruit);

    if (index >= 0) {
      this.fruits.splice(index, 1);
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.fruits.push(event.option.viewValue);
    this.fruitInput.nativeElement.value = '';
    this.fruitCtrl.setValue(null);
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.allFruits.filter(fruit => fruit.toLowerCase().indexOf(filterValue) === 0);
  }

  public consultaPersona() {
    let resultado = this.personaService.consultaPersona();
    resultado.subscribe(
      (response) => {
        this.lstPersona = [];
        this.listaPersona = response.Data;

        this.listaPersona.forEach(eachEvent => {
          let itemPersona: Persona = {
            IdPersona :eachEvent.IdPersona,
            Identificacion :eachEvent.Identificacion,
            Nombres :eachEvent.Nombres,
            Edad :eachEvent.Edad,
            Codigo:eachEvent.codigo
          }
          this.allFruits.push(eachEvent.Nombres)
        })
        console.log('Listapersona',this.listaPersona);
        console.log('Listapersona',this.allFruits);
      },
      (error) => { console.log("EROR", error); }
    );

  }

}

