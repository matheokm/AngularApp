import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormChipPersonaComponent } from './form-chip-persona.component';

describe('FormChipPersonaComponent', () => {
  let component: FormChipPersonaComponent;
  let fixture: ComponentFixture<FormChipPersonaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormChipPersonaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormChipPersonaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
