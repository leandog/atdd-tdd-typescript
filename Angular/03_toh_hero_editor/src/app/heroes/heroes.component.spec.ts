import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule } from '@angular/forms';

import { HeroesComponent } from './heroes.component';

describe('HeroesComponent', () => {
  let component: HeroesComponent;
  let htmlElement: HTMLElement;

  let fixture: ComponentFixture<HeroesComponent>;

  let heroName = 'Pinkie Pie';
  let heroId = 1;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FormsModule],
      declarations: [HeroesComponent],
    }).compileComponents();
  });

  beforeEach(async () => {
    fixture = TestBed.createComponent(HeroesComponent);
    component = fixture.componentInstance;
    htmlElement = fixture.nativeElement as HTMLElement;
    fixture.detectChanges();
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it(`should have the hero '${heroName}'`, () => {
    // TODO: Add Hero member to component
    // expect(component.hero.name).toEqual(heroName);
    expect('').toEqual(heroName);
  });

  it('should render hero', () => {
    expect(htmlElement.querySelector('#details')?.textContent).toContain(`${heroName.toUpperCase()} Details`);
    expect(htmlElement.querySelector('#id')?.textContent).toContain(heroId);
  });

  it('should have hero.name bound to #heroName input', () => {
    let expectedName = 'Fluttershy';

    let heroNameInput: HTMLInputElement = htmlElement.querySelector('#heroName') as HTMLInputElement;

    heroNameInput.value = expectedName;
    heroNameInput.dispatchEvent(new Event('input'));

    // TODO: Add element to hero template
    // expect(component.hero.name).toBe(expectedName);
    expect('').toBe(expectedName);
  });
});
