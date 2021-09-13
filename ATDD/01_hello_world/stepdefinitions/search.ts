import { browser } from 'protractor';
import { SearchPageObject } from '../pages/searchPage';

import { Given, When } from 'cucumber';

const chai = require('chai').use(require('chai-as-promised'));

const expect = chai.expect;

const search: SearchPageObject = new SearchPageObject();

Given(/^I am on Google search page$/, async () => {
  await expect(browser.getTitle()).to.eventually.equal('Google');
});

When(/^I type "(.*?)"$/, async (text) => {
  await search.searchTextBox.sendKeys(text);
});
