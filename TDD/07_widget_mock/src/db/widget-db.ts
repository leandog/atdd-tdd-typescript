export class Widget {
  constructor(public id: number, public name: string, public size: number) {}
}

export class WidgetDb {
  private widgets = [
    new Widget(1, 'coffee cup', 5),
    new Widget(2, 'lamp', 10),
    new Widget(3, 'chair', 30),
    new Widget(4, 'coin', 1),
  ];

  queryAll(): Array<Widget> {
    setTimeout(() => {}, 1000);
    return this.widgets;
  }
}
