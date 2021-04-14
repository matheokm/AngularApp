import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

//importamos ruta del api
import {Configuration} from '../../Config/app.configuration';

//importar modelo context
import {Context} from '../../Modelos/Context';
import {Genero} from '../../Modelos/Genero';

@Injectable({
  providedIn: 'root'
})
export class GeneroService {

  constructor(private http: HttpClient) { }
  public ConsultaGenero(): Observable<any> {
    let sessionString = localStorage.getItem("datos")
    let obj = <Context>JSON.parse(sessionString)
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    headers = headers.set('Authorization', "Bearer ");
   return this.http.get(Configuration.servidor + "/Genero/ConsultaGenero", { headers: headers });
  }
}
