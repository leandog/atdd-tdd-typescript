import { Then } from 'cucumber';
import { PuppyPageObject } from '../pages/puppyPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Then(/^I see "(.*?)"$/, async (text) => {
  let puppyPage = new PuppyPageObject();
  let pageText = await puppyPage.text();

  expect(pageText.includes(text)).to.be.true;
});
