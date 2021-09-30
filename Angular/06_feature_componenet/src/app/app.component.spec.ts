import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let app: AppComponent;
  let compiled: HTMLElement;

  let fixture: ComponentFixture<AppComponent>;

  let title = 'Tour of Heroes';

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AppComponent],
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AppComponent);
    app = fixture.componentInstance;
    compiled = fixture.nativeElement as HTMLElement;
    fixture.detectChanges();
  });

  it('should create the app', () => {
    expect(app).toBeTruthy();
  });

  it(`should have as title '${title}'`, () => {
    expect(app.title).toEqual(title);
  });

  it('should render title', () => {
    expect(compiled.querySelector('.content h1')?.textContent).toContain(`${title}`);
  });

  it('should contain heroes', () => {
    expect(compiled.querySelector('app-heroes')).not.toBe(null);
  });
});
