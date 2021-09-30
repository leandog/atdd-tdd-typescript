import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule } from '@angular/forms';

import { HeroesComponent } from './heroes.component';

import { HEROES } from '../mock-heroes';
import { Hero } from '../hero';

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
    expect(component.selectedHero.name).toEqual(heroName);
  });

  it(`should have heroes '${heroName}'`, () => {
    // TODO: Add heros to component
    expect(component.heroes).toEqual(HEROES);

    // let heroes: Array<Hero> = [];
    // expect(heroes).toEqual(HEROES);
  });

  it('should render hero', () => {
    expect(htmlElement.querySelector('#details')?.textContent).toContain(`${heroName.toUpperCase()} Details`);
    expect(htmlElement.querySelector('#heroId')?.textContent).toContain(heroId);
  });

  it('should render heros', () => {
    for (let hero of HEROES) {
      let heroRowId = `#row_${hero.id}`;

      expect(htmlElement.querySelector(heroRowId)?.textContent).toContain(hero.name);
      expect(htmlElement.querySelector(heroRowId)?.textContent).toContain(hero.id);
    }
  });

  it('should have hero.name bound to #heroName input', () => {
    let expectedName = 'Fluttershy';

    let heroNameInput: HTMLInputElement = htmlElement.querySelector('#heroName') as HTMLInputElement;

    heroNameInput.value = expectedName;
    heroNameInput.dispatchEvent(new Event('input'));

    expect(component.selectedHero.name).toBe(expectedName);
  });
});
