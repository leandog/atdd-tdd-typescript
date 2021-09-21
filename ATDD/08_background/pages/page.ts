import { by, element, ElementFinder, ElementArrayFinder } from 'protractor';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

export class PageObject {
  private title: string;
  private container: ElementFinder;
  private submitButtons: ElementArrayFinder;
  private checkboxes: ElementArrayFinder;

  constructor(title: string) {
    this.title = title;
    this.container = element(by.id('container'));
    this.submitButtons = element.all(by.css('input[type="submit"]'));
    this.checkboxes = element.all(by.css('input[type="checkbox"]'));
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

  public async sendKeys(inputId: string, text: string) {
    let input = await element(by.id(inputId));
    await input.sendKeys(text);
  }

  public async clear(inputId: string) {
    let input = await element(by.id(inputId));
    await input.clear();
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

  public async clickCheckbox(value: string) {
    let checkboxes = await this.checkboxes;
    for (let index in checkboxes) {
      let checkboxElement = checkboxes[index];
      let checkboxId = await checkboxElement.getAttribute('id');

      if (checkboxId === value) {
        await checkboxElement.click();
        return;
      }
    }

    throw `Checkbox with text ${value} not found`;
  }
}
