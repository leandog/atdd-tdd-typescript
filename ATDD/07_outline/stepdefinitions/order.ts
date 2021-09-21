import { When, Then } from 'cucumber';
import { OrderPage } from '../pages/orderPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

When(/^the order form is completely filled in$/, async () => {
  let orderPage = new OrderPage();
  await orderPage.loaded();
  await orderPage.fillInOrderForm();
});

When(/^I blank out (.*)$/, async (fieldId) => {
  let orderPage = new OrderPage();
  await orderPage.clear(fieldId);
});

Then(/^I see (.*) in errors$/, async (message) => {
  let orderPage = new OrderPage();
  let text = await orderPage.text();

  expect(text.includes(message)).to.be.true;
});
