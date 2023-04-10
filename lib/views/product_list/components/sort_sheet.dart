part of product_list;

void showSortBottomSheet(BuildContext context, ListVM vm) {
  String currentSortValue = vm.sortBy;
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
                  'SORT PRODUCT',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.sortValue.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          activeColor: Colors.black,
                          title: Text(vm.sortValue[index]),
                          value: vm.sortValue[index],
                          groupValue: currentSortValue,
                          onChanged: (value) {
                            vm.setSortValue(value.toString());
                            vm.sortProduct(value.toString());
                            Navigator.pop(context);
                          });
                    }),
              ),
            ],
          ),
        );
      });
}
