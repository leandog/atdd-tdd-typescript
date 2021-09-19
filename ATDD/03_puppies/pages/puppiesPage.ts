import { browser, by, element, ElementArrayFinder, ElementFinder } from 'protractor';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

export class PuppiesPageObject {
  private page: string = 'http://localhost:3000';
  private title = "Sally's Puppy Adoption Agency";

  private puppyList: ElementArrayFinder;

  constructor() {
    this.puppyList = element.all(by.className('puppy_list'));
  }

  public async goto() {
    await browser.get(this.page);
    await expect(browser.getTitle()).to.eventually.equal(this.title);
  }

  public async getPuppyFromRow(name: string): Promise<ElementFinder> {
    let puppyList = await this.puppyList;

    var puppy: ElementFinder;
    for (let index in puppyList) {
      let puppyElement = puppyList[index];
      let rowText = await puppyElement.getText();

      if (rowText.includes(name)) {
        puppy = puppyElement;
        break;
      }
    }

    return puppy;
  }

  public async viewDetails(puppy: ElementFinder): Promise<ElementFinder> {
    return puppy.element(by.className('rounded_button'));
  }
}
