import { $, ElementFinder } from 'protractor';

export class SearchPageObject {
  public searchTextBox: ElementFinder;

  constructor() {
    this.searchTextBox = $("input[title='Search']");
  }
}
