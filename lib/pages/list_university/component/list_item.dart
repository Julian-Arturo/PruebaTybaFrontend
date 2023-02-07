import '../../../export.dart';

class UniversityListItem extends StatelessWidget {
  const UniversityListItem({
    Key? key,
    required this.limit,
    required this.scroll,
    required List<UniversityModel?> data,
    this.tap,
  })  : _data = data,
        super(key: key);

  final ScrollController scroll;
  final List<UniversityModel?> _data;
  final int? limit;
  final bool? tap;

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: tap!
            ? GridView.builder(
                controller: scroll,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1),
                itemCount: limit,
                itemBuilder: (context, index) {
                  if (index < limit! && index < _data.length) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InformationScreen(
                                        country: _data[index]!.country,
                                        name: _data[index]!.name,
                                        domains: _data[index]!.domains[index],
                                        webpages: _data[index]!.webPages[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 30,
                                        top: 20,
                                        bottom: 20,
                                        left: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: size.width * 0.4,
                                    height: size.height * 0.2,
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            _data[index]!.name.characters.first,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: size.height * 0.07,
                                              fontFamily: 'Acme Regular',
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: limit != 20
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
                              "...",
                            ),
                    );
                  }
                },
              )
            : ListView.builder(
                padding: const EdgeInsets.all(30),
                controller: scroll,
                itemCount: limit,
                itemBuilder: (context, index) {
                  if (index < limit! && index < _data.length) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InformationScreen(
                                        country: _data[index]!.country,
                                        name: _data[index]!.name,
                                        domains: _data[index]!.domains.first,
                                        webpages: _data[index]!.webPages.first,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 30,
                                        top: 20,
                                        bottom: 20,
                                        left: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: size.width * 0.8,
                                    height: size.height * 0.08,
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.6,
                                          child: Text(
                                            _data[index]!.name,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              fontFamily: 'Acme Regular',
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: limit != 20
                          ? const Center(child: CircularProgressIndicator())
                          : const Text(
                              "...",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 50,
                                  fontFamily: "Acme Regular"),
                            ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
