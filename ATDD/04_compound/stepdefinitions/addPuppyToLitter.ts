import { Given, When, Then } from 'cucumber';
import { LitterPage } from '../pages/litter';
import { PuppiesPage } from '../pages/puppiesPage';
import { PuppyPage } from '../pages/puppyPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

Given(/^I have added the puppy "(.*?)" to my litter$/, async (puppyName) => {
  // TODO: Implement
  // on puppies page
  // view details of a puppy
  // on puppy page
  // click adopt
  // on litter page
});
