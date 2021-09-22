import { BeforeAll, After, AfterAll, Status, setDefaultTimeout } from 'cucumber';

import { browser } from 'protractor';
import { config } from '../config/config';

BeforeAll({ timeout: 100 * 1000 }, async () => {
  // fix local browser startup timeout, not ideal for production
  setDefaultTimeout(60000);

  await browser.get(config.baseUrl);
});

After(async function (scenario) {
  if (scenario.result.status === Status.FAILED) {
    // screenShot is a base-64 encoded PNG
    const screenShot = await browser.takeScreenshot();
    this.attach(screenShot, 'image/png');
  }
});

AfterAll({ timeout: 100 * 1000 }, async () => {
  await browser.quit();
});
