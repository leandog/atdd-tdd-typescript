import { When } from 'cucumber';
import { ContactPage } from '../pages/contactPage';

When(/^I fill the form in with the following values$/, async function (table) {
  let contactPage = new ContactPage();
  await contactPage.loaded();

  // TODO Implement
});
