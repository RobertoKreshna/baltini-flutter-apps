part of product_list;

void showFilterBottomSheet(BuildContext context, ListVM vm) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 35,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Style.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'FILTER',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.filterType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(vm.filterType[index]),
                          value: false,
                          onChanged: (value) {});
                    }),
              ),
            ],
          ),
        );
      });
}
