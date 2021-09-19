import { Given, When } from 'cucumber';
import { PuppiesPageObject } from '../pages/puppiesPage';

Given(/^I am on the home page$/, async () => {
  await new PuppiesPageObject().goto();
});

When(/^I click on the puppy "(.*?)"$/, async (puppyName) => {
  let puppiesPage = new PuppiesPageObject();

  let puppy = await puppiesPage.getPuppyFromRow(puppyName);
  let viewDetails = await puppiesPage.viewDetails(puppy);

  viewDetails.click();
});
