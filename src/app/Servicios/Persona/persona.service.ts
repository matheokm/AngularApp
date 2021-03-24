import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

//importamos ruta del api
import {Configuration} from '../../Config/app.configuration';

//importar modelo context
import {Context} from '../../Modelos/Context';
import {Persona} from '../../Modelos/Persona';

@Injectable({
  providedIn: 'root'
})
export class PersonaService {

  constructor(private http: HttpClient) { }
  public consultaPersona(): Observable<any> {
    let sessionString = localStorage.getItem("datos")
    let obj = <Context>JSON.parse(sessionString)
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    headers = headers.set('Authorization', "Bearer ");

    return this.http.get(Configuration.servidor + "/Persona/GetPersona", { headers: headers });
  }

  public ActualizaPersona(Persona:Persona, accion:string) {
    //RECUPERAR VARIABLES DE SESION
    let sessionString = localStorage.getItem("datos")
    let obj = <Context>JSON.parse(sessionString)
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    headers = headers.set('Authorization', "Bearer " );
    console.log(headers);
    const params = new HttpParams()

    const data = 'accion=' + accion;
    console.log(params);
    return this.http.post(Configuration.servidor + "/Persona/ActualizaPersona?" + data,Persona,{ headers: headers, params: params });
  }
}

