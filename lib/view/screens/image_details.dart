import 'package:bti_homework_1/model/image_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageDetails extends StatefulWidget {
  ImageInfoModel imageInfo;
  ImageDetails({required this.imageInfo,super.key});

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {

  String? selectedBackground;
  bool moreButton =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [

                Image.network(
                  selectedBackground ?? "${widget.imageInfo.imageUrl}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height > MediaQuery.of(context).size.width ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.width *0.5,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.imageInfo.name}",
                        style: GoogleFonts.anekKannada(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.imageInfo.description}",
                        style: GoogleFonts.anekKannada(
                          fontSize: 14,
                          height: 1.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pictures",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: moreButton ? widget.imageInfo.pictures?.length ??0 :MediaQuery.of(context).size.width ~/ 70,
                          itemBuilder: (context, index) {
                            return index !=
                                    MediaQuery.of(context).size.width ~/ 70 - 1 || moreButton
                                ? GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedBackground = widget.imageInfo.pictures?[index].imageUrl ?? widget.imageInfo.imageUrl;
                                      });
                                    },
                                  child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.network(
                                          "${widget.imageInfo.pictures?[index].imageUrl ?? widget.imageInfo.imageUrl}",
                                          width: 55,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                )
                                : GestureDetector(
                              onTap: (){
                                    setState(() {
                                      moreButton = true;
                                    });
                              },
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: 55,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "+${widget.imageInfo.pictures?.length ?? 25 - MediaQuery.of(context).size.width ~/ 70}",
                                          style: GoogleFonts.anekKannada(
                                            height: 2.5,
                                            letterSpacing: 0.7,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                );
                          },
                        ),
                      ),
                      TextButton(onPressed: (){}, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("More in Bali",style: GoogleFonts.anekKannada(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF147508)
                          ),),
                          Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFF147508),size: 20,),
                        ],
                      ),),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert_rounded,color: Colors.white,),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
