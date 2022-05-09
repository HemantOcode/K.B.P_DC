import 'package:flutter/material.dart';
import 'package:flutter_application_1/commanWidget/app_bar.dart';
import 'package:flutter_application_1/home/events/event_modal.dart';
import 'package:flutter_application_1/home/events/event_provider.dart';
import 'package:flutter_application_1/home/events/widget/add_new_event_bottom_sheet.dart';
import 'package:flutter_application_1/home/events/widget/event_widget.dart';
import 'package:flutter_application_1/home/widgets/home_app_drawer.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final List<EventModal> events = Provider.of<EventProvider>(context).events;
    final dW = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: const CustomAppBar(title: 'Events'),
        appBar: AppBar(
          title: Text(
            'Events',
            style: TextStyle(letterSpacing: 2),
          ),
          bottom: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("On-Going"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Up-Comming"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Finished"),
                  ),
                ),
              ]),
        ),

        drawer: const HomeScreenAppDrawer(),
        // body:
        // ListView.separated(
        //   physics: const BouncingScrollPhysics(),
        //       padding: EdgeInsets.only(top: 20),

        //   itemCount: events.length,
        //   separatorBuilder: (BuildContext context, int index) => SizedBox(
        //     height: dW * 0.05,
        //   ),
        //   itemBuilder: (BuildContext context, int index) =>
        //       EventWidget(eventModal: events[index]),
        // ),
        body: TabBarView(children: [
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20),
            itemCount: events.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: dW * 0.05,
            ),
            itemBuilder: (BuildContext context, int index) =>
                EventWidget(eventModal: events[index]),
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20),
            itemCount: events.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: dW * 0.05,
            ),
            itemBuilder: (BuildContext context, int index) =>
                EventWidget(eventModal: events[index]),
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20),
            itemCount: events.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: dW * 0.05,
            ),
            itemBuilder: (BuildContext context, int index) =>
                EventWidget(eventModal: events[index]),
          ),
        ]),
        floatingActionButton: Container(
          child: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: true,
                  builder: (context) => AddEventBottomSheet());
            },
            label: Text('Add new event'),
            icon: Icon(Icons.add),
          ),
          margin: EdgeInsets.only(bottom: dW * 0.1),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
