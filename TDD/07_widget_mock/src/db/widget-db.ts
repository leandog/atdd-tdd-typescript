export class Widget {
  constructor(public id: number, public name: string, public size: number) {}
}

export class WidgetDb {
  // database latency
  private latency = 2500;

  private widgets = [
    new Widget(1, 'coffee cup', 5),
    new Widget(2, 'lamp', 10),
    new Widget(3, 'chair', 30),
    new Widget(4, 'coin', 1),
  ];

  async queryAll(): Promise<Array<Widget>> {
    await this.delay(this.latency * this.widgets.length);
    return this.widgets;
  }

  private delay(ms: number) {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }
}
