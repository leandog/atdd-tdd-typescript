import { by, element, ElementFinder, ElementArrayFinder } from 'protractor';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

export class PageObject {
  private title: string;
  private container: ElementFinder;
  private submitButtons: ElementArrayFinder;

  constructor(title: string) {
    this.title = title;
    this.container = element(by.id('container'));
    this.submitButtons = element.all(by.css('input[type="submit"]'));
  }

  public async loaded() {
    let pageText = await this.container.getText();
    await expect(pageText.includes(this.title));
  }

  public async text() {
    let pageText = await this.container.getText();

    let submitButtons = await this.submitButtons;
    for (let index in submitButtons) {
      let buttonElement = submitButtons[index];
      pageText += await buttonElement.getAttribute('value');
    }

    return pageText;
  }

  public async clickButton(value: string) {
    let submitButtons = await this.submitButtons;
    for (let index in submitButtons) {
      let buttonElement = submitButtons[index];
      let buttonText = await buttonElement.getAttribute('value');

      if (buttonText === value) {
        await buttonElement.click();
        return;
      }
    }

    throw `Button with value ${value} not found`;
  }
}
