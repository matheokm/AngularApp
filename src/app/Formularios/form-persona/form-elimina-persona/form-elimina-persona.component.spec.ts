import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormEliminaPersonaComponent } from './form-elimina-persona.component';

describe('FormEliminaPersonaComponent', () => {
  let component: FormEliminaPersonaComponent;
  let fixture: ComponentFixture<FormEliminaPersonaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormEliminaPersonaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormEliminaPersonaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
