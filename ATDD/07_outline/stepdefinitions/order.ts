import { When, Then } from 'cucumber';
import { OrderPage } from '../pages/orderPage';

const chai = require('chai').use(require('chai-as-promised'));
const expect = chai.expect;

When(/^the order form is completely filled in$/, async () => {
  // TODO: Implement
});

When(/^I blank out (.*)$/, async (fieldId) => {
  // TODO: Implement
});

Then(/^I see (.*) in errors$/, async (message) => {
  // TODO: Implement
});
