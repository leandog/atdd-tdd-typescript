import { Component, OnInit } from '@angular/core';

import { Hero } from '../hero';
import { HEROES } from '../mock-heroes';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.css'],
})
export class HeroesComponent implements OnInit {
  // TODO: Add heroes array

  selectedHero: Hero = {
    id: 11,
    name: 'Pinkie Pie',
  };

  constructor() {}

  ngOnInit(): void {}
}
