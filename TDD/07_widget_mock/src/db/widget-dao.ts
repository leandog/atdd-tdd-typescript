import { Widget, WidgetDb } from './widget-db';

export class WidgetDao {
  loadWidgets(): Array<Widget> {
    return new WidgetDb().queryAll();
  }
}
