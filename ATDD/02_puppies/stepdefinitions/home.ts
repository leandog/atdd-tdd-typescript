import { $, element, by, ElementFinder, browser } from 'protractor';

import { Given, When, Then } from 'cucumber';

const chai = require('chai').use(require('chai-as-promised'));

const expect = chai.expect;

Given(/^I am on the home page$/, async () => {
  let expectedTitle = "Sally's Puppy Adoption Agency";
  await browser.get('http://localhost:3000');
  await expect(browser.getTitle()).to.eventually.equal(expectedTitle);
});

When(/^I click on the puppy "(.*?)"$/, async (puppyName) => {
  let puppyList = await element.all(by.className('puppy_list'));

  var puppy: ElementFinder;
  for (let index in puppyList) {
    let puppyElement = puppyList[index];
    let rowText = await puppyElement.getText();

    if (rowText.includes(puppyName)) {
      puppy = puppyElement;
      break;
    }
  }

  let viewDetails = await puppy.element(by.className('rounded_button'));
  await viewDetails.click();
});

Then(/^I see "(.*?)"$/, async (text) => {
  let buttons = await element.all(by.className('rounded_button'));
  let isFound = false;

  for (let index in buttons) {
    let button = buttons[index];
    let rowText = await button.getAttribute('value');

    if (rowText.includes(text)) {
      isFound = true;
      break;
    }
  }

  expect(isFound).to.be.true;
});
