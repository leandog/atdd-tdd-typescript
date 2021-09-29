import { Widget, WidgetDao } from './db/widget-dao';

export class WidgetService {
  constructor() {}

  loadWidgets(): Array<Widget> {
    let widgetDao = new WidgetDao();
    let widgets = widgetDao.loadWidgets();

    return widgets;
  }

  loadWidgetsByName(): Array<Widget> {
    let widgetDao = new WidgetDao();
    let widgets = widgetDao.loadWidgets();

    return widgets.sort((w1, w2) => {
      if (w1.name < w2.name) {
        return -1;
      }
      if (w1.name > w2.name) {
        return 1;
      }
      return 0;
    });
  }
}
