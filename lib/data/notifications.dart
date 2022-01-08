class Notifications {
  final int id;
  final String title;
  final String subTitle;
  final String time;


  const Notifications({required this.id, required this.title, required this.subTitle, required this.time});
}

class NotificationList {
  static List<Notifications> list() {
    const data = <Notifications> [
      Notifications(
        id: 1,
        title: 'Singal up deep line',
        subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
        time: '1:45 PM'
      ),
      Notifications(
          id: 2,
          title: 'Singal up deep line',
          subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
          time: '10:20 AM'
      ),
      Notifications(
          id: 3,
          title: 'Sunday Offer',
          subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
          time: '03:45 PM'
      ),
      Notifications(
          id: 4,
          title: 'Star Sunday Offer',
          subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
          time: '07:20 AM'
      ),
      Notifications(
          id: 5,
          title: 'Biggest Offer',
          subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
          time: '11:45 AM'
      ),
      Notifications(
          id: 6,
          title: 'Black Friday',
          subTitle: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit sed',
          time: '10:20 PM'
      ),
    ];
    return data;
  }
}