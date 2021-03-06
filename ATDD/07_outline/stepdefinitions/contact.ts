import { When } from 'cucumber';
import { ContactPage } from '../pages/contactPage';

When(/^I fill the form in with the following values$/, async function (table) {
  let contactPage = new ContactPage();
  await contactPage.loaded();

  let rowHash = table.rowsHash();
  for (let row in rowHash) {
    await contactPage.sendKeys(row, rowHash[row]);
  }
});
