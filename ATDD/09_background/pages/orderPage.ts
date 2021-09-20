import { by, element, ElementFinder } from 'protractor';
import { PageObject } from './page';

export class OrderPage extends PageObject {
  private placeOrderButton: ElementFinder;

  constructor() {
    super('Please Enter Your Details');
    this.placeOrderButton = element(by.name('commit'));
  }

  public async setName(value: string) {
    return this.sendKeys('order_name', value);
  }

  public async setAddress(value: string) {
    return this.sendKeys('order_address', value);
  }

  public async setEmail(value: string) {
    return this.sendKeys('order_email', value);
  }

  public async setPayType(value: string) {
    return this.sendKeys('order_pay_type', value);
  }

  public async clickPlaceOrder() {
    var placeOrderButton = await this.placeOrderButton;
    await placeOrderButton.click();
  }

  public async fillInOrderForm() {
    await this.setName('Happy Puppy');
    await this.setAddress('123 Puppy Bowl');
    await this.setEmail('happypuppy@puppy.com');
    await this.setPayType('Check');
  }
}
