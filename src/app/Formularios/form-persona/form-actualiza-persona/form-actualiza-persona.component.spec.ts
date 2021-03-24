import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormActualizaPersonaComponent } from './form-actualiza-persona.component';

describe('FormActualizaPersonaComponent', () => {
  let component: FormActualizaPersonaComponent;
  let fixture: ComponentFixture<FormActualizaPersonaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormActualizaPersonaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormActualizaPersonaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
