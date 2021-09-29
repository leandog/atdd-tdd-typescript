import { Widget, WidgetDb } from './widget-db';

export class WidgetDao {
  loadWidgets(): Promise<Array<Widget>> {
    return new WidgetDb().queryAll();
  }
}
