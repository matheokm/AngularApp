import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormcrearPersonaComponent } from './formcrear-persona.component';

describe('FormcrearPersonaComponent', () => {
  let component: FormcrearPersonaComponent;
  let fixture: ComponentFixture<FormcrearPersonaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormcrearPersonaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormcrearPersonaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
