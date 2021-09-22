import { Given } from 'cucumber';
import { LitterPage } from '../pages/litterPage';
import { PuppiesPage } from '../pages/puppiesPage';
import { PuppyPage } from '../pages/puppyPage';

Given(/^I have added the puppy "(.*?)" to my litter$/, async (puppyName) => {
  // on puppies page
  let puppiesPage = new PuppiesPage();
  await puppiesPage.goto();

  // view details of a puppy
  let puppy = await puppiesPage.getPuppyFromRow(puppyName);
  await puppiesPage.select(puppy);

  // on puppy page
  let puppyPage = new PuppyPage();
  await puppyPage.includesText(puppyName);

  // click adopt
  await puppyPage.clickButton('Adopt Me!');

  // on litter page
  let litterPage = new LitterPage();
  await litterPage.includesText(puppyName);
});
