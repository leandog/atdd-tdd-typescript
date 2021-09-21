import { When, Then } from 'cucumber';
import { PageObject } from '../pages/page';
import { PuppyPage } from '../pages/puppyPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Then(/^I see "(.*?)"$/, async (text) => {
  let page = new PageObject('');
  let pageText = await page.text();

  let expected = pageText.includes(text);
  expect(expected).to.be.true;
});

When(/^I click on "(.*?)"$/, async (text) => {
  let puppyPage = new PuppyPage();
  await puppyPage.clickButton(text);
});
