import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/search/presentation/manager/search_movies/search_movies_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });
   

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          onChanged: (value) {
            if (formkey.currentState!.validate()) {
              BlocProvider.of<SearchMoviesCubit>(context)
                  .getSearchedMovies(searchValue: value);
            }
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'this field is required';
            } else {
              return null;
            }
          },
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              border: OutlineInputBorder(),
              hintText: 'Movie',
              suffixIcon: Icon(Icons.movie),
              label: Text('Search')),
        ),
      ),
    );
  }
}
