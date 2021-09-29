import { WidgetService } from '../src/widget-service';

/*
PROBLEM REQUIREMENTS:
Users lover our new Widget service. The ability to get all the Widgets sorted by name was a fantastic success!
Recently, users have been asking to be able to get all their Widgets sorted by size.

It took a while for us to get here, but we are finally in a position where the sorted by size feature has
been added to the backlog for this sprint.

The team has been using TDD, but has ran into some slowness recently when running the tests...
When there was only one Widget available, the problem was not noticable, but now with the addition of the
last new Widget, the tests started failing. One of the dev's on the team noticed if the timeout
was extended that the tests started passing again.

The WidgetDb and WidgetDao are well covered with intergration tests, but team has decided that the WidgetService
can be switched to a pure unit test.

Tasks:
- Invert the WidgetDao dependency in the WidgetService test suite to run
    without the extension of the default timeout
- Add the sort by size feature to the WidgetService
*/

describe('Test Widget Service', () => {
  let originalTimeout = 0;

  beforeEach(function () {
    originalTimeout = jasmine.DEFAULT_TIMEOUT_INTERVAL;
    jasmine.DEFAULT_TIMEOUT_INTERVAL = 60000;
  });

  afterEach(function () {
    jasmine.DEFAULT_TIMEOUT_INTERVAL = originalTimeout;
  });

  it('loads widgets', async () => {
    let expectedIds = [1, 2, 3, 4];

    // TODO: update to use WidgetService with injected WidgetDao
    // let widgetService = new WidgetService(widgetDao);
    let widgetService = new WidgetService();
    let widgets = await widgetService.loadWidgets();

    let result = widgets.map((widget) => widget.id);
    expect(result).toEqual(expectedIds);
  });

  it('loads sorted widgets', async () => {
    let expectedNames = ['chair', 'coffee cup', 'coin', 'lamp'];

    let widgetService = new WidgetService();
    let widgets = await widgetService.loadWidgetsByName();

    let result = widgets.map((widget) => widget.name);
    expect(result).toEqual(expectedNames);
  });
});

// TODO: use mockWidgetDao in WidgetService object creation
// let mockWidgetDao = {
//   loadWidgets: async (): Promise<Array<Widget>> => {
//     return [
//       new Widget(1, 'coffee cup', 5),
//       new Widget(2, 'lamp', 10),
//       new Widget(3, 'chair', 30),
//       new Widget(4, 'coin', 1),
//     ];
//   },
// };
