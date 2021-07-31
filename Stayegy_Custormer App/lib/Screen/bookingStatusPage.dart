import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/container/bookedtile.dart';
import 'package:stayegy/container/historytile.dart';
import 'package:stayegy/container/loading_Overlay.dart';

class BookingStatusPage extends StatefulWidget {
  @override
  _BookingStatusPageState createState() => _BookingStatusPageState();
}

class _BookingStatusPageState extends State<BookingStatusPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          leading: IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 5,
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color(0xff191919),
              size: 30,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xff191919),
            unselectedLabelColor: Color(0xffa2a2a2),
            labelColor: Color(0xff191919),
            onTap: (index) {},
            tabs: [
              Tab(
                child: Text(
                  'BOOKED',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'HISTORY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<LoadingBloc, LoadingBlocState>(
          builder: (context, state) {
            return TabBarView(children: [
              state is ProcessingState
                  ? LoadingOverlay().buildWidget(context)
                  : state is LoadedBookingStatusState && state.bookingDetails != null
                      ? BookedTile(
                          bookingDetails: state.bookingDetails,
                        )
                      : Container(
                          child: Text("No Bookings Active!"),
                        ),
              state is ProcessingState
                  ? LoadingOverlay().buildWidget(context)
                  : state is LoadedBookingStatusState
                      ? ListView.builder(
                          itemCount: state.historyList.length,
                          itemBuilder: (context, index) {
                            return HistoryTile(bookingDetails: state.historyList[index]);
                          })
                      : Container(),
            ]);
          },
        ),
      ),
    );
  }
}
