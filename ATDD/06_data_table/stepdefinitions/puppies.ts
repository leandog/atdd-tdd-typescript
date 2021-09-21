import { Given, When, Then } from 'cucumber';
import { PuppiesPage } from '../pages/puppiesPage';

Given(/^I am on the home page$/, async () => {
  await new PuppiesPage().goto();
});

When(/^I click on the puppy "(.*?)"$/, async (puppyName) => {
  let puppiesPage = new PuppiesPage();

  let puppy = await puppiesPage.getPuppyFromRow(puppyName);
  let viewDetails = await puppiesPage.viewDetails(puppy);

  await viewDetails.click();
});

When(/^I click on the email icon$/, async () => {
  let puppiesPage = new PuppiesPage();
  await puppiesPage.clickContactIcon();
});

Then(/^I return to the home page$/, async () => {
  let puppiesPage = new PuppiesPage();
  await puppiesPage.loaded();
});
