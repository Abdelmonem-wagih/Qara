import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qara/Feature/ToDO/cubit/singel_state/to_do_cubit.dart';
import 'package:qara/Feature/ToDO/cubit/singel_state/to_do_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right:8.0),
            child: Icon(Icons.menu , color: Colors.grey,size: 40,),
          ),
        ],
        leading: const Icon(Icons.home_outlined , color: Colors.grey,size: 40,),
      ),
      body: Column(
        children: [
          const Text('Booking' , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 20),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Enter Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {
                    final title = titleController.text.trim();
                    final description = descriptionController.text.trim();
                    if (title.isNotEmpty) {
                      context.read<ToDoCubit>().addItem(title, description);
                      titleController.clear();
                      descriptionController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter title '),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Enter Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ToDoCubit, ToDoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final toDO = state.items[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.red, // Border color
                          width: 1, // Border width
                          style: BorderStyle
                              .solid, // Border style (solid, dashed, etc.)
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/pngtree-hotel-building-and-ocean-beach-image_1387689.jpg',
                              height: 80,
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(toDO['title'] ?? ''),
                                  const SizedBox(height: 0),
                                  Text(toDO['description'] ?? ''),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<ToDoCubit>()
                                          .deleteItem(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
