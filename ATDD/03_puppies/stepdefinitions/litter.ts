import { Then } from 'cucumber';
import { LitterPage } from '../pages/litter';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Then(/^I see the puppy "(.*?)" is in my litter$/, async (text) => {
  let litterPage = new LitterPage();
  // TODO: Implement
  let pageText = await litterPage.text();

  let expected = pageText.includes(text);
  expect(expected).to.be.true;
});
