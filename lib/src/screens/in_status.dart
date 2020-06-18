// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../models/area_statics.dart';
// import '../models/statics.dart';
// import '../widgets/in_status_card.dart';

// class InStatus extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(250),
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xff000000).withOpacity(0.16),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           color: Theme.of(context).errorColor,
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 5,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 7,
//                         child: SvgPicture.asset(
//                           'assets/images/iraq_map.svg',
//                           color: Theme.of(context).errorColor,
//                           height: 100,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(
//                             vertical: 25,
//                             horizontal: 13,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).errorColor,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 7,
//                         child: SvgPicture.asset(
//                           'assets/images/virus-2.svg',
//                           color: Theme.of(context).errorColor,
//                           height: 100,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Text(
//                     "المصابون",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                       color: Theme.of(context).errorColor,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 17,
//           ),
//           Expanded(
//             child: BlocBuilder<StaticslineBloc, StaticslineState>(
//               bloc: BlocProvider.of<StaticslineBloc>(context),
//               builder: (context, state) {
//                 if (state is StaticsLineFetched) {
//                   return GridView.builder(
//                     itemCount: 10,
//                     physics: BouncingScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 2,
//                       mainAxisSpacing: 8,
//                       crossAxisSpacing: 17,
//                     ),
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 8, right: 8),
//                         child: InStatusCard(
//                           statics: AreaStatics(
//                             id: 1,
//                             name: 'Test',
//                             today: Statics(
//                               active: 0,
//                               deaths: 1,
//                               recovered: 2,
//                             ),
//                             total: Statics(
//                               active: 1,
//                               deaths: 2,
//                               recovered: 3,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }

//                 if (state is StaticslineError) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.sentiment_very_dissatisfied),
//                         Text(state.error),
//                       ],
//                     ),
//                   );
//                 }

//                 return SpinKitCircle();
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
