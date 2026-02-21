import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahand/interviewexam/body_label.dart';
import 'package:sahand/interviewexam/body_part_class.dart';

enum BodyPartId {
  head,
  neck,
  chest,
  stomach,
  pelvis,
  rightpelvis,
  leftpelvis,
  rightshoulder,
  rightarm,
  rightelbow,
  rightforearm,
  righthand,
  leftshoulder,
  leftarm,
  leftelbow,
  leftforearm,
  lefthand,
  rightthigh,
  rightknee,
  rightleg,
  rightankle,
  rightlegfinger,
  leftthigh,
  leftknee,
  leftleg,
  leftankle,
  leftlegfinger,
  lefteye,
  righteye,
}

class Humanbody extends StatefulWidget {
  @override
  _HumanbodyState createState() => _HumanbodyState();
}

class _HumanbodyState extends State<Humanbody> {
  String rawSvg = '';
  BodyPartId? selectedId;

  @override
  void initState() {
    super.initState();
    loadSvg();
  }

  Future<void> loadSvg() async {
    final svgString = await rootBundle.loadString('assets/images/front.svg');
    setState(() {
      rawSvg = svgString;
    });
  }

  void selectPart(BodyPartId id) {
    setState(() {
      selectedId = id;
    });
  }

String colorizeSvg() {
  if (rawSvg.isEmpty) return '';
  if (selectedId == null) return rawSvg;

  final id = selectedId!;

  final regex = RegExp(
    r'(<(path|ellipse|circle|rect|polygon|polyline|line)\b[^>]*id="' +
        id.name +
        r'"[^>]*>)',
    caseSensitive: false,
  );

  return rawSvg.replaceAllMapped(regex, (match) {
    String tag = match.group(1)!;

    if (tag.contains('fill="')) {
      tag = tag.replaceAll(RegExp(r'fill="[^"]*"'), 'fill="red"');
    }
    if (tag.contains('stroke="')) {
      tag = tag.replaceAll(RegExp(r'stroke="[^"]*"'), 'stroke="red"');
    }

    if (!tag.contains('fill') && !tag.contains('stroke')) {
      if (tag.endsWith('/>')) {
        tag = tag.replaceFirst('/>', ' fill="red" stroke="red"/>');
      } else {
        tag = tag.replaceFirst('>', ' fill="red" stroke="red">');
      }
    }

    return tag;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: rawSvg.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Center(
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 4,
                      child: stackSection(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Stack stackSection() {
    return Stack(
      children: [
        SvgPicture.string(colorizeSvg(), height: 600, width: 600),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.head,
            top: 5,
            left: 107,
            width: 40,
            height: 20,
          ),
          onTap: selectPart,
        ),
         BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.head,
            top: 40,
            left: 107,
            width: 40,
            height: 25,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.chest,
            top: 100,
            left: 95,
            width: 70,
            height: 70,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightleg,
            top: 420,
            left: 150,
            width: 30,
            height: 110,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftleg,
            top: 425,
            left: 77,
            width: 30,
            height: 105,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftarm,
            top: 120,
            left: 45,
            width: 30,
            height: 70,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightarm,
            top: 120,
            left: 180,
            width: 30,
            height: 70,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightshoulder,
            top: 100,
            left: 170,
            width: 35,
            height: 15,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftshoulder,
            top: 100,
            left: 50,
            width: 30,
            height: 15,
          ),
          onTap: selectPart,
        ),
        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.neck,
            top: 77,
            left: 90,
            width: 80,
            height: 20,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.stomach,
            top: 180,
            left: 90,
            width: 80,
            height: 65,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.pelvis,
            top: 250,
            left: 100,
            width: 60,
            height: 40,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightpelvis,
            top: 260,
            left: 150,
            width: 40,
            height: 40,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftpelvis,
            top: 260,
            left: 60,
            width: 40,
            height: 40,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightelbow,
            top: 195,
            left: 190,
            width: 25,
            height: 20,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightforearm,
            top: 215,
            left: 200,
            width: 25,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.righthand,
            top: 280,
            left: 215,
            width: 30,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftelbow,
            top: 195,
            left: 40,
            width: 28,
            height: 20,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftforearm,
            top: 215,
            left: 35,
            width: 25,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.lefthand,
            top: 280,
            left: 10,
            width: 30,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightthigh,
            top: 310,
            left: 140,
            width: 40,
            height: 90,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightknee,
            top: 390,
            left: 145,
            width: 40,
            height: 30,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightankle,
            top: 520,
            left: 155,
            width: 30,
            height: 25,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.rightlegfinger,
            top: 550,
            left: 165,
            width: 30,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftthigh,
            top: 305,
            left: 75,
            width: 40,
            height: 90,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftknee,
            top: 390,
            left: 75,
            width: 30,
            height: 30,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftankle,
            top: 525,
            left: 77,
            width: 30,
            height: 25,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.leftlegfinger,
            top: 550,
            left: 60,
            width: 30,
            height: 60,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.lefteye,
            top: 20,
            left: 110,
            width: 15,
            height: 15,
          ),
          onTap: selectPart,
        ),

        BodyPartPositioned(
          part: BodyPartClass(
            id: BodyPartId.righteye,
            top: 20,
            left: 130,
            width: 15,
            height: 15,
          ),
          onTap: selectPart,
        ),
        if (selectedId != null) ...getLabelPosition(selectedId!),
      ],
    );
  }

  final Map<BodyPartId, BodyPartLabel> bodyPartLabels = {
  BodyPartId.head: BodyPartLabel(
    text: 'کله',
    position: LabelPosition(top: 0, left: 50),
  ),
  BodyPartId.chest: BodyPartLabel(
    text: 'سینه',
    position: LabelPosition(top: 110, left: 105),
  ),
  BodyPartId.leftshoulder: BodyPartLabel(
    text: 'شونه چپ',
    position: LabelPosition(top: 50, left: 5),
  ),
  BodyPartId.rightshoulder: BodyPartLabel(
    text: 'شونه راست',
    position: LabelPosition(top: 50, left: 175),
  ),
  BodyPartId.leftarm: BodyPartLabel(
    text: 'بازو چپ',
    position: LabelPosition(top: 130, left: 0),
  ),
  BodyPartId.leftelbow: BodyPartLabel(
    text: 'ارنج چپ',
    position: LabelPosition(top: 170, left: 0),
  ),
  BodyPartId.leftforearm: BodyPartLabel(
    text: 'ساعد چپ',
    position: LabelPosition(top: 220, left: 0),
  ),
  BodyPartId.lefthand: BodyPartLabel(
    text: 'دست چپ',
    position: LabelPosition(top: 340, left: 0, right: 200),
  ),
  BodyPartId.rightarm: BodyPartLabel(
    text: 'بازو راست',
    position: LabelPosition(top: 130, left: 180),
  ),
  BodyPartId.rightelbow: BodyPartLabel(
    text: 'ارنج راست',
    position: LabelPosition(top: 180, left: 160),
  ),
  BodyPartId.rightforearm: BodyPartLabel(
    text: 'ساعد راست',
    position: LabelPosition(top: 220, left: 175),
  ),
  BodyPartId.righthand: BodyPartLabel(
    text: 'دست راست',
    position: LabelPosition(top: 340, left: 180),
  ),
  BodyPartId.neck: BodyPartLabel(
    text: 'گردن',
    position: LabelPosition(top: 70, left: 105),
  ),
  BodyPartId.stomach: BodyPartLabel(
    text: 'شکم',
    position: LabelPosition(top: 180, left: 105),
  ),
  BodyPartId.pelvis: BodyPartLabel(
    text: 'لگن',
    position: LabelPosition(top: 250, left: 105),
  ),
  BodyPartId.rightpelvis: BodyPartLabel(
    text: 'لگن راست',
    position: LabelPosition(top: 260, left: 170),
  ),
  BodyPartId.leftpelvis: BodyPartLabel(
    text: 'لگن چپ',
    position: LabelPosition(top: 260, left: 20),
  ),
  BodyPartId.rightthigh: BodyPartLabel(
    text: 'ران راست',
    position: LabelPosition(top: 310, left: 180),
  ),
  BodyPartId.rightknee: BodyPartLabel(
    text: 'زانو راست',
    position: LabelPosition(top: 390, left: 180),
  ),
  BodyPartId.rightleg: BodyPartLabel(
    text: 'ساق راست',
    position: LabelPosition(top: 430, left: 130),
  ),
  BodyPartId.rightankle: BodyPartLabel(
    text: 'مچ پا راست',
    position: LabelPosition(top: 520, left: 180),
  ),
  BodyPartId.rightlegfinger: BodyPartLabel(
    text: 'انگشت پای راست',
    position: LabelPosition(top: 560, left: 130),
  ),
  BodyPartId.leftthigh: BodyPartLabel(
    text: 'ران چپ',
    position: LabelPosition(top: 310, left: 10),
  ),
  BodyPartId.leftknee: BodyPartLabel(
    text: 'زانو چپ',
    position: LabelPosition(top: 390, left: 10),
  ),
  BodyPartId.leftleg: BodyPartLabel(
    text: 'ساق چپ',
    position: LabelPosition(top: 420, left: 10),
  ),
  BodyPartId.leftankle: BodyPartLabel(
    text: 'مچ پا چپ',
    position: LabelPosition(top: 520, left: 10),
  ),
  BodyPartId.leftlegfinger: BodyPartLabel(
    text: 'انگشت پای چپ',
    position: LabelPosition(top: 560, left: 10),
  ),
  BodyPartId.lefteye: BodyPartLabel(
    text: 'چشم چپ',
    position: LabelPosition(top: 0, left: 20),
  ),
  BodyPartId.righteye: BodyPartLabel(
    text: 'چشم راست',
    position: LabelPosition(top: 0, left: 160),
  ),
};

  Widget buildLabel(BodyPartLabel info) {
    return Positioned(
      top: info.position.top,
      left: info.position.left,
      right: info.position.right,
      bottom: info.position.bottom,
      child: Container(
        padding: EdgeInsets.all(6),
        color: Colors.white.withOpacity(0.7),
        child: Text(
          info.text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  List<Widget> getLabelPosition(BodyPartId id) {
  final data = bodyPartLabels[id];

  if (data == null) return [];

  return [
    buildLabel(data),
  ];
}
}

class BodyPartPositioned extends StatelessWidget {
  final BodyPartClass part;
  final Function(BodyPartId) onTap;
  const BodyPartPositioned({Key? key, required this.part, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: part.top,
      bottom: part.bottom,
      left: part.left,
      right: part.right,
      width: part.width,
      height: part.height,
      child: GestureDetector(
        onTap: () => onTap(part.id),
        child: Container(color: Colors.red),
      ),
    );
  }
}
