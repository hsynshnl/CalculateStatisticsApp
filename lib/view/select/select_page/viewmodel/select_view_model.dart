part of 'package:istatistik_hesaplama/view/select/select_page/view/select_view.dart';

class _SelectListView extends StatelessWidget {
  const _SelectListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: SelectModels.selectItems.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blueGrey,
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20))),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        SelectModels.selectItems[index].page,
                  ),
                );
              },
              child: Text(
                SelectModels.selectItems[index].text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              )),
        );
      }),
    );
  }
}
