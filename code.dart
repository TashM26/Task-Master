// if (ToDoS?.length == 0 || snapshot.hasError) {
                //   return Center(
                //     child: Column(
                //       children: [
                //         SizedBox(height: deviceSize.height / 10),
                //         Image.asset('assets/images/empty_logo.png'),
                //         const Text(
                //           'What do you want to do today?',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20,
                //           ),
                //         ),
                //         const SizedBox(height: 10),
                //         const Text(
                //           'Tap + to add your tasks',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ],
                //     ),
                //   );
                // }


                // FutureBuilder(
      //   future: getDocId(),
      //   builder: (context, snapshot) {
      //     if (docIDs.length == 0) {
      //       return Center(
      //         child: Column(
      //           children: [
      //             SizedBox(height: deviceSize.height / 10),
      //             Image.asset('assets/images/empty_logo.png'),
      //             const Text(
      //               'What do you want to do today?',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             const SizedBox(height: 10),
      //             const Text(
      //               'Tap + to add your tasks',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return StreamBuilder(
      //         stream: FirebaseFirestore.instance
      //             .collection('${user?.uid} TO-DO\'S')
      //             .snapshots(),
      //         builder: (context, snapshot) {
      //           final getToDoS = snapshot.data?.docs;

      //           final ToDoS = getToDoS
      //               ?.map(
      //                 (transaction) => ToDo.fromJson(
      //                   transaction.data(),
      //                 ),
      //               )
      //               .toList();

      //           return Padding(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 16,
      //               vertical: 16,
      //             ),
      //             child: SingleChildScrollView(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   TextField(
      //                     style: const TextStyle(color: Colors.white),
      //                     decoration: AppStyles().searchFieldStyle,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                       vertical: 20,
      //                     ),
      //                     child: Container(
      //                       height: 40,
      //                       width: deviceSize.width / 4,
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(6),
      //                         color: AppColors.semiDarkGrey,
      //                       ),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         children: const [
      //                           Text(
      //                             'Today',
      //                             style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 12,
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.keyboard_arrow_down_rounded,
      //                             color: Colors.white,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                   ListView.builder(
      //                     shrinkWrap: true,
      //                     physics: const NeverScrollableScrollPhysics(),
      //                     itemBuilder: (context, index) {
      //                       if (ToDoS == null) {
      //                         return const SizedBox.shrink();
      //                       }
      //                       return ToDoCard(
      //                         docIDs: docIDs[index],
      //                         title: ToDoS[index].title ?? '',
      //                         time: '13:18',
      //                         categoryIndex: ToDoS[index].category ?? 10,
      //                         taskPriority: ToDoS[index].taskPriority ?? 1,
      //                         completed: ToDoS[index].completed!,
      //                       );
      //                     },
      //                     itemCount: ToDoS?.length ?? 1,
      //                   ),
      //                   // Padding(
      //                   //   padding: const EdgeInsets.symmetric(
      //                   //     vertical: 20,
      //                   //   ),
      //                   //   child: Container(
      //                   //     height: 40,
      //                   //     width: deviceSize.width / 3.5,
      //                   //     decoration: BoxDecoration(
      //                   //       borderRadius: BorderRadius.circular(6),
      //                   //       color: AppColors.semiDarkGrey,
      //                   //     ),
      //                   //     child: Row(
      //                   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   //       children: const [
      //                   //         Text(
      //                   //           'Completed',
      //                   //           style: TextStyle(
      //                   //             color: Colors.white,
      //                   //             fontSize: 12,
      //                   //           ),
      //                   //         ),
      //                   //         Icon(
      //                   //           Icons.keyboard_arrow_down_rounded,
      //                   //           color: Colors.white,
      //                   //         ),
      //                   //       ],
      //                   //     ),
      //                   //   ),
      //                   // ),
      //                   // CompletedToDoListView(docIDs: docIDs),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(
      //         color: AppColors.purple,
      //       ),
      //     );
      //   },
      // ),


      // Container(
              //   height: deviceSize.height / 4,
              //   width: deviceSize.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     color: AppColors.darkGrey,
              //   ),
              //   child: TableCalendar(
              //     firstDay: _firstDate,
              //     lastDay: _lastDate,
              //     focusedDay: _focusedDay,
              //     calendarFormat: _calendarFormat,
              //     headerStyle: const HeaderStyle(
              //       titleCentered: true,
              //       formatButtonVisible: false,
              //       titleTextStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //       leftChevronIcon: Icon(
              //         Icons.arrow_back_ios_new_rounded,
              //         color: Colors.white,
              //       ),
              //       rightChevronIcon: Icon(
              //         Icons.arrow_forward_ios_rounded,
              //         color: Colors.white,
              //       ),
              //     ),
              //     daysOfWeekStyle: const DaysOfWeekStyle(
              //       weekdayStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //       weekendStyle: TextStyle(
              //         color: AppColors.red,
              //       ),
              //     ),
              //     calendarStyle: const CalendarStyle(
              //       weekendTextStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //       defaultTextStyle: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     pageAnimationCurve: Curves.bounceIn,
              //     selectedDayPredicate: (day) {
              //       return isSameDay(_selectedDay, day);
              //     },
              //     onDaySelected: (selectedDay, focusedDay) {
              //       if (!isSameDay(_selectedDay, selectedDay)) {
              //         setState(() {
              //           _selectedDay = selectedDay;
              //           _focusedDay = focusedDay;
              //         });
              //       }
              //     },
              //     onFormatChanged: (format) {
              //       if (_calendarFormat != format) {
              //         setState(() {
              //           _calendarFormat = format;
              //         });
              //       }
              //     },
              //     onPageChanged: (focusedDay) {
              //       _focusedDay = focusedDay;
              //     },
              //   ),
              // ),

               // CircularPercentIndicator(
              //   radius: 120,
              //   lineWidth: 15,
              //   curve: Curves.bounceIn,
              //   percent: _remainingTime / (60 * 60),
              //   center: Text(
              //     "${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}",
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 40,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              //   progressColor: AppColors.purple,
              //   backgroundColor: AppColors.darkGrey,
              // ),

               // void _startTimer() {
  //   if (_isTimerRunning) return;

  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _remainingTime--;
  //     });

  //     if (_remainingTime <= 0) {
  //       _stopTimer();
  //     }
  //   });

  //   setState(() {
  //     _isTimerRunning = true;
  //   });
  // }

  // void _stopTimer() {
  //   _timer.cancel();
  //   _remainingTime = 60 * 60;
  //   setState(() {
  //     _isTimerRunning = false;
  //   });
  // }
  //   int _remainingTime = 60 * 60; // 1 hour in seconds
  // bool _isTimerRunning = false;
  // late Timer _timer = Timer.periodic(Duration.zero, (_) {});

  // SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: deviceSize.height / 12,
      //         ),
      //         Icon(
      //           _isDndOn == false
      //               ? Icons.notifications_off_rounded
      //               : Icons.notifications_active_rounded,
      //           color: Colors.white,
      //           size: 96,
      //         ),
      //         SizedBox(
      //           height: deviceSize.height / 10,
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 16),
      //           child: Text(
      //             'While your focus mode is on, all of your notifications will be off',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 16,
      //             ),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //         SizedBox(height: deviceSize.height / 40),
      //         GestureDetector(
      //           onTap: () {
      //             _setDnd();
      //             setState(() {
      //               _isDndOn = !_isDndOn;
      //             });
      //           },
      //           child: Container(
      //             height: 48,
      //             width: deviceSize.width / 2.5,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(4),
      //               color: AppColors.purple,
      //             ),
      //             child: Center(
      //               child: Text(
      //                 _isDndOn == true ? 'Start Focusing' : 'Stop Focusing',
      //                 style: const TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 16,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //       ],
      //     ),
      //   ),
      // ),

      // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('${user?.uid} TO-DO\'S')
              //         .where('sortDateTime', isEqualTo: sortDateTime)
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       final getToDoS = snapshot.data?.docs;

              //       final toDoList = getToDoS
              //           ?.map(
              //             (transaction) => ToDo.fromJson(
              //               transaction.data(),
              //             ),
              //           )
              //           .toList();
              //       taskCounter(toDoList ?? []);
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 10),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               height: 58,
              //               width: deviceSize.width / 2.5,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(4),
              //                 color: AppColors.darkGrey,
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   '$taskLeft Task left',
              //                   style: const TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 16,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               height: 58,
              //               width: deviceSize.width / 2.5,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(4),
              //                 color: AppColors.darkGrey,
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   '$taskDone Task done',
              //                   style: const TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 16,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     }),

              // TextField(
            //   style: const TextStyle(color: Colors.white),
            //   controller: _titleController,
            //   maxLength: 16,
            //   decoration: InputDecoration(
            //     counterText: '',
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(4),
            //       borderSide: const BorderSide(
            //         color: AppColors.grey,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //       borderSide: const BorderSide(
            //         color: AppColors.purple,
            //       ),
            //     ),
            //     hintText: 'Do math homework',
            //     hintStyle: const TextStyle(
            //       color: AppColors.grey,
            //     ),
            //     contentPadding: const EdgeInsets.symmetric(
            //       horizontal: 12,
            //       vertical: 16,
            //     ),
            //   ),
            // ),

             // TextField(
            //   style: const TextStyle(color: Colors.white),
            //   controller: _descriptionController,
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(4),
            //       borderSide: const BorderSide(
            //         color: AppColors.grey,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //       borderSide: const BorderSide(
            //         color: AppColors.purple,
            //       ),
            //     ),
            //     hintText: 'Do chapter 2 to 5 for next week',
            //     hintStyle: const TextStyle(color: AppColors.grey),
            //     contentPadding: const EdgeInsets.symmetric(
            //       horizontal: 12,
            //       vertical: 16,
            //     ),
            //   ),
            // AppStyles.descriptionFieldStyle,
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 32),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           showDialog(
            //             context: context,
            //             builder: (context) {
            //               return AlertDialog(
            //                 backgroundColor: AppColors.darkGrey,
            //                 title: const Center(
            //                   child: Text(
            //                     'Choose Category',
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 content: SingleChildScrollView(
            //                   child: Column(
            //                     children: [
            //                       CategoryGridView(
            //                         categoryColors: ToDoData.categoryColors,
            //                         categoryIcons: ToDoData.categoryIcons,
            //                         categoryText: ToDoData.categoryText,
            //                         categoryIndex: categoryIndex,
            //                         onUpdateCategoryIndex: _updateCategoryIndex,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             },
            //           );
            //         },
            //         child: Container(
            //           height: 48,
            //           width: deviceSize.width / 2.3,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(4),
            //             color: AppColors.darkGrey,
            //           ),
            //           child: Center(
            //             child: SvgPicture.asset(
            //               'assets/images/tag.svg',
            //               height: 30,
            //               width: 30,
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           showDialog(
            //             context: context,
            //             builder: (context) {
            //               return AlertDialog(
            //                 backgroundColor: AppColors.addTaskAlertDialogBg,
            //                 title: const Center(
            //                   child: Text(
            //                     'Task Priority',
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 content: SingleChildScrollView(
            //                   child: Column(
            //                     children: [
            //                       TaskPriorityGridView(
            //                         onTaskPriorityChanged:
            //                             _updateTaskPriorityIndex,
            //                         taskPriorityIndex: taskPriorityIndex,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             },
            //           );
            //         },
            //         child: Container(
            //           height: 48,
            //           width: deviceSize.width / 2.3,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(4),
            //             color: AppColors.darkGrey,
            //           ),
            //           child: Center(
            //             child: SvgPicture.asset(
            //               'assets/images/flag.svg',
            //               height: 30,
            //               width: 30,
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


// const Text(
                //   'Email',
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // TextField(
                //   style: const TextStyle(color: Colors.white),
                //   controller: _emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(4),
                //       borderSide: const BorderSide(
                //         color: AppColors.grey,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: const BorderSide(
                //         color: AppColors.purple,
                //       ),
                //     ),
                //     hintText: 'Enter your email',
                //     hintStyle: const TextStyle(
                //       color: AppColors.grey,
                //     ),
                //     contentPadding: const EdgeInsets.symmetric(
                //       horizontal: 12,
                //       vertical: 16,
                //     ),
                //   ),
                // ),

                 // const Text(
                //   'Password',
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // TextField(
                //   style: const TextStyle(color: Colors.white),
                //   controller: _passwordController,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(4),
                //       borderSide: const BorderSide(
                //         color: AppColors.grey,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: const BorderSide(
                //         color: AppColors.purple,
                //       ),
                //     ),
                //     hintText: 'Enter your password',
                //     hintStyle: const TextStyle(color: AppColors.grey),
                //     contentPadding: const EdgeInsets.symmetric(
                //       horizontal: 12,
                //       vertical: 16,
                //     ),
                //   ),
                // ),

                 // Container(
                //   width: double.infinity,
                //   height: deviceSize.height * 0.06,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     color: Colors.transparent,
                //     border: Border.all(
                //       color: AppColors.purple,
                //       width: 2,
                //     ),
                //   ),
                //   child: TextButton(
                //     onPressed: () {
                //       // Login button pressed
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           height: deviceSize.height * 0.04,
                //           width: deviceSize.width * 0.07,
                //           color: Colors.transparent,
                //           child:
                //               Image.asset('assets/images/microsoft_logo.png'),
                //         ),
                //         const SizedBox(width: 10),
                //         const Text(
                //           'Login with Microsoft',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // Container(
                      //   height: 30,
                      //   width: 50,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(4),
                      //     color: AppColors.semiDarkGrey,
                      //     border: Border.all(color: AppColors.purple),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       SvgPicture.asset(
                      //         'assets/images/flag.svg',
                      //       ),
                      //       Text(
                      //         '$taskPriority',
                      //         style: const TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // SvgPicture.asset(
                            //   // ToDoData.categoryIcons[categoryIndex],
                            //   height: 24,
                            //   width: 24,
                            // ),
                            // Text(
                            //   ToDoData.categoryText[categoryIndex],
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 12,
                            //   ),
                            // ),

                  //            Row(
                  //   children: [
                  //     Container(
                  //       height: 30,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         // color: ToDoData.categoryColors[categoryIndex],
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                            
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     // 
                  //   ],
                  // ),


            //       const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 5,
            //     right: 10,
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
                 
            //     ],
            //   ),
            // ),

            // Row(
                  //   children: [
                  //     // Container(
                  //     //   height: 30,
                  //     //   width: 100,
                  //     //   decoration: BoxDecoration(
                  //     //     borderRadius: BorderRadius.circular(4),
                  //     //     color: ToDoData.categoryColors[widget.categoryIndex],
                  //     //   ),
                  //     //   child: Row(
                  //     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     //     children: [
                  //     //       SvgPicture.asset(
                  //     //         ToDoData.categoryIcons[widget.categoryIndex],
                  //     //         height: 24,
                  //     //         width: 24,
                  //     //       ),
                  //     //       Text(
                  //     //         ToDoData.categoryText[widget.categoryIndex],
                  //     //         style: const TextStyle(
                  //     //           color: Colors.white,
                  //     //           fontSize: 12,
                  //     //         ),
                  //     //       ),
                  //     //     ],
                  //     //   ),
                  //     // ),
                  //     // const SizedBox(width: 10),
                  //     // Container(
                  //     //   height: 30,
                  //     //   width: 50,
                  //     //   decoration: BoxDecoration(
                  //     //     borderRadius: BorderRadius.circular(4),
                  //     //     color: AppColors.semiDarkGrey,
                  //     //     border: Border.all(color: AppColors.purple),
                  //     //   ),
                  //     //   child: Row(
                  //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     //     children: [
                  //     //       SvgPicture.asset(
                  //     //         'assets/images/flag.svg',
                  //     //       ),
                  //     //       Text(
                  //     //         '${widget.taskPriority}',
                  //     //         style: const TextStyle(
                  //     //           color: Colors.white,
                  //     //         ),
                  //     //       ),
                  //     //     ],
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),

                  // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 5,
            //     right: 10,
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       // 
            //     ],
            //   ),
            // ),


            // MaterialButton(
                          //   elevation: 0,
                          //   highlightColor: Colors.transparent,
                          //   splashColor: Colors.transparent,
                          //   minWidth: 40,
                          //   onPressed: () {
                          //     setState(() {
                          //       currentScreen = const ProfilePage();
                          //       _currentIndex = 3;
                          //     });
                          //   },
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       SvgPicture.asset(
                          //         _currentIndex == 3
                          //             ? 'assets/icons/fill_profile.svg'
                          //             : 'assets/icons/profile.svg',
                          //       ),
                          //       const SizedBox(height: 5),
                          //       Text(
                          //         LocaleKeys.profile.tr(),
                          //         style: const TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // MaterialButton(
                            //   elevation: 0,
                            //   highlightColor: Colors.transparent,
                            //   splashColor: Colors.transparent,
                            //   minWidth: 40,
                            //   onPressed: () {
                            //     setState(() {
                            //       currentScreen = const FocusPage();
                            //       _currentIndex = 2;
                            //     });
                            //   },
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       SvgPicture.asset(
                            //         _currentIndex == 2
                            //             ? 'assets/icons/fill_focus.svg'
                            //             : 'assets/icons/focus.svg',
                            //       ),
                            //       const SizedBox(height: 5),
                            //       Text(
                            //         LocaleKeys.focus.tr(),
                            //         style: const TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // MaterialButton(
                        //   elevation: 0,
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   minWidth: 30,
                        //   onPressed: () {
                        //     setState(() {
                        //       currentScreen = const CalendarPage();
                        //       _currentIndex = 1;
                        //     });
                        //   },
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SvgPicture.asset(
                        //         _currentIndex == 1
                        //             ? 'assets/icons/fill_calendar.svg'
                        //             : 'assets/icons/calendar.svg',
                        //       ),
                        //       const SizedBox(height: 5),
                        //       Text(
                        //         LocaleKeys.calendar.tr(),
                        //         style: const TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 12,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                         // MaterialButton(
                            //   elevation: 0,
                            //   highlightColor: Colors.transparent,
                            //   splashColor: Colors.transparent,
                            //   minWidth: 40,
                            //   onPressed: () {
                            //     setState(() {
                            //       currentScreen = const HomePage();
                            //       _currentIndex = 0;
                            //     });
                            //   },
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       SvgPicture.asset(
                            //         _currentIndex == 0
                            //             ? 'assets/icons/fill_home.svg'
                            //             : 'assets/icons/home.svg',
                            //       ),
                            //       const SizedBox(height: 5),
                            //       Text(
                            //         LocaleKeys.home.tr(),
                            //         style: const TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // MaterialButton(
                            //   elevation: 0,
                            //   highlightColor: Colors.transparent,
                            //   splashColor: Colors.transparent,
                            //   minWidth: 40,
                            //   onPressed: () {
                            //     setState(() {
                            //       currentScreen = const HomePage();
                            //       _currentIndex = 0;
                            //     });
                            //   },
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       SvgPicture.asset(
                            //         _currentIndex == 0
                            //             ? 'assets/icons/fill_home.svg'
                            //             : 'assets/icons/home.svg',
                            //       ),
                            //       const SizedBox(height: 5),
                            //       Text(
                            //         LocaleKeys.home.tr(),
                            //         style: const TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 12,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),