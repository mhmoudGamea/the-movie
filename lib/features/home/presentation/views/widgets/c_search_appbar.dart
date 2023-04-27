import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/core/constants.dart';

// Statemanagment cubit
import '../../model_views/home_cubit/home_cubit.dart';

class CSearchAppbar extends StatelessWidget {
  const CSearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return Container(
      height: data.getDeviceHeight(context) * 0.1,
      padding: EdgeInsets.only(right: data.getDeviceWidth(context) * 0.03),
      decoration: BoxDecoration(
        color: thirdColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // search
          cTextFieldWidget(data),
          // dropdown
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return cDropDownWidget(data);
            },
          ),
        ],
      ),
    );
  }

  // search
  Widget cTextFieldWidget(HomeCubit data) {
    return Expanded(
      child: TextField(
        cursorColor: Colors.white,
        controller: data.getSearchController,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              data.fetchSearchResults(data.getSearchController.text);
            },
          ),
        ),
        onSubmitted: (value) {
          data.fetchSearchResults(value);
        },
        onChanged: (value) {
          // print(data.getSearchController.text);
          data.fetchSearchResults(value);
        },
      ),
    );
  }

  // drop down button
  Widget cDropDownWidget(HomeCubit data) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(
          Icons.menu_rounded,
          size: 20,
          color: Colors.white,
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        elevation: 2,
        dropdownColor: thirdColor.withOpacity(0.5),
        value: data.getDropdownButtonValue,
        items: const [
          DropdownMenuItem<String>(
            value: 'popular',
            child: Text('Popular'),
          ),
          DropdownMenuItem<String>(
            value: 'upcoming',
            child: Text('Upcoming'),
          ),
        ],
        onChanged: (value) {
          data.setDropdownButtonValue = value;
        },
      ),
    );
  }
}
