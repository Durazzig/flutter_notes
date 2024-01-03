// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SharedButton<T> extends StatelessWidget {
//   const SharedButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       width: double.infinity,
//       child: Consumer<T>(
//         builder: (context, notifier, child) {
//           return ElevatedButton(
//             style: ButtonStyle(
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               backgroundColor: MaterialStateProperty.all(
//                 Theme.of(context).colorScheme.primary,
//               ),
//             ),
//             onPressed: () => signIn(context),
//             child: notifier.loadingStatus == LoadingState.loading
//                 ? const CircularProgressIndicator()
//                 : Text(
//                     "Sign In",
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//           );
//         },
//       ),
//     );
//   }
// }
