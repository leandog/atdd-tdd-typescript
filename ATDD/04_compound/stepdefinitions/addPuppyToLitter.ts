import { Given, When, Then } from 'cucumber';
import { LitterPage } from '../pages/litter';
import { PuppiesPage } from '../pages/puppiesPage';
import { PuppyPage } from '../pages/puppyPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Given(/^I have added the puppy "(.*?)" to my litter$/, async (puppyName) => {
  // TODO: Implement
  // on puppies page
  let puppiesPage = new PuppiesPage();
  await puppiesPage.goto();

  // view details of a puppy
  let puppy = await puppiesPage.getPuppyFromRow(puppyName);
  let viewDetails = await puppiesPage.viewDetails(puppy);
  await viewDetails.click();

  // on puppy page
  let puppyPage = new PuppyPage();
  let puppyPageText = await puppyPage.text();
  expect(puppyPageText.includes(puppyName)).to.be.true;

  // click adopt
  await puppyPage.clickButton('Adopt Me!');

  // on litter page
  let litterPage = new LitterPage();
  let litterPageText = await litterPage.text();
  expect(litterPageText.includes(puppyName)).to.be.true;
});
