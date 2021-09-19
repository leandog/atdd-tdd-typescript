import { When, Then } from 'cucumber';
import { PuppyPage } from '../pages/puppyPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Then(/^I see "(.*?)"$/, async (text) => {
  let puppyPage = new PuppyPage();
  let pageText = await puppyPage.text();

  let expected = pageText.includes(text);
  expect(expected).to.be.true;
});

When(/^I click on "(.*?)"$/, async (text) => {
  let puppyPage = new PuppyPage();
  await puppyPage.clickButton(text);
});
