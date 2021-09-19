import { browser, by, element, ElementArrayFinder, ElementFinder } from 'protractor';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

export class PuppyPageObject {
  private puppyList: ElementArrayFinder;

  constructor() {
    this.puppyList = element.all(by.className('puppy_list'));
  }

  public async text() {
    let pageContainer = await element(by.id('container'));
    let pageText = await pageContainer.getText();

    let submitButtons = await element.all(by.css('input[type="submit"]'));

    for (let index in submitButtons) {
      let buttonElement = submitButtons[index];
      pageText += await buttonElement.getAttribute('value');
    }

    return pageText;
  }
}
