import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/model/user_model.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
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
  bool isLoading = false;

  myInit() {
    setState(() {
      isLoading = true;
    });
    try {
      Provider.of<EventProvider>(context, listen: false).fetchEvents();
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  haveOnGoingEvents(List<EventModal> events) {
    return events
            .where((element) =>
                DateTime.now().isAfter(element.startDate) &&
                DateTime.now().isBefore(element.endDate))
            .toList()
            .isEmpty
        ? false
        : true;
  }

  haveUpCommingEvents(List<EventModal> events) {
    return events
            .where((element) => DateTime.now().isBefore(element.startDate))
            .toList()
            .isEmpty
        ? false
        : true;
  }

  haveFinishedEvents(List<EventModal> events) {
    return events
            .where((element) =>
                DateTime.now().isAfter(element.startDate) &&
                DateTime.now().isAfter(element.endDate))
            .toList()
            .isEmpty
        ? false
        : true;
  }

  Widget getOnGoingEvents(EventModal event) {
    if (DateTime.now().isAfter(event.startDate) &&
        DateTime.now().isBefore(event.endDate)) {
      return EventWidget(eventModal: event);
    }
    return const SizedBox.shrink();
  }

  Widget getUpCommingEvents(EventModal event) {
    if (DateTime.now().isBefore(event.startDate)) {
      return EventWidget(eventModal: event);
    }
    return const SizedBox.shrink();
  }

  Widget getFinisedEvents(EventModal event) {
    if (DateTime.now().isAfter(event.startDate) &&
        DateTime.now().isAfter(event.endDate)) {
      return EventWidget(eventModal: event);
    }
    return const SizedBox.shrink();
  }

  @override
  void initState() {
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    final List<EventModal> events = Provider.of<EventProvider>(context).events;
    final UserModel user = Provider.of<AuthProvider>(context).userModel;
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(children: [
                haveOnGoingEvents(events)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: events.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          // height: dW * 0.05,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            getOnGoingEvents(events[index]),
                      )
                    : Center(
                        child: Text('No Ongoing Events'),
                      ),
                haveUpCommingEvents(events)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: events.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          // height: dW * 0.05,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            getUpCommingEvents(events[index]),
                      )
                    : Center(
                        child: Text('No Up-Comming Events'),
                      ),
                haveFinishedEvents(events)
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: events.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          // height: dW * 0.05,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            getFinisedEvents(events[index]),
                      )
                    : Center(
                        child: Text('No Finised Events'),
                      ),
              ]),
        floatingActionButton: user.role == "Admin"
            ? Container(
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
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
