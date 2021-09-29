import { Widget } from './db/widget-db';
import { WidgetDao } from './db/widget-dao';

export class WidgetService {
  // TODO: invert dependency by passing in WidgetDao in constructor

  loadWidgets(): Promise<Array<Widget>> {
    // TODO: use injected WidgetDao
    let widgetDao = new WidgetDao();
    let widgets = widgetDao.loadWidgets();

    return widgets;
  }

  async loadWidgetsByName(): Promise<Array<Widget>> {
    // TODO: use injected WidgetDao
    let widgetDao = new WidgetDao();
    let widgets = await widgetDao.loadWidgets();

    return widgets.sort((w1, w2) => {
      if (w1.name < w2.name) {
        return -1;
      }
      if (w1.name > w2.name) {
        return 1;
      }
      return 0;
    });

    // TODO: add loadWidgetsBySize
  }
}
