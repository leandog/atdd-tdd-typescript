import { When } from 'cucumber';
import { LitterPage } from '../pages/litterPage';

When(/^I click on "(.*?)" in litter$/, async (text) => {
  let litterPage = new LitterPage();

  await litterPage.clickButton(text);
});

When(/^I add a "(.*?)" to my order$/, async (text) => {
  let litterPage = new LitterPage();

  await litterPage.clickCheckbox(text);
});
