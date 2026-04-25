import 'package:accounting/module/menu/menu_notifier.dart';
import 'package:flutter/material.dart';

import '../../utils/images_path.dart';

class MenuSetupWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuSetupWidget({super.key, required this.value});

  @override
  State<MenuSetupWidget> createState() => _MenuSetupWidgetState();
}

class _MenuSetupWidgetState extends State<MenuSetupWidget> {
  bool _isExpanded = false;
  int _isExpandedSub = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.settings, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "SETUP",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        // ExpansionTile(
        //   tilePadding: EdgeInsets.zero,
        //   childrenPadding: EdgeInsets.zero,
        //   shape: const Border(),
        //   expandedAlignment: Alignment.centerLeft,
        //   collapsedIconColor: Colors.white,
        //   expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        //   onExpansionChanged: (expanded) {
        //     if (expanded) {
        //       setState(() {
        //         _isExpandedSub = 1;
        //       });
        //     } else {
        //       setState(() {
        //         _isExpandedSub = 0;
        //       });
        //     }
        //   },
        //   title: Container(
        //     decoration: BoxDecoration(
        //       color: _isExpandedSub == 1 ? const Color.fromARGB(255, 0, 125, 228) : Colors.transparent,
        //     ),
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     child: Row(
        //       children: [
        //         Image.asset(ImageAssets.building, height: 30, color: Colors.white),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         const Text(
        //           "Kantor",
        //           style: TextStyle(fontSize: 16, color: Colors.white),
        //         )
        //       ],
        //     ),
        //   ),
        //   children: [
        //     InkWell(
        //       onTap: () => widget.value.gantimenu(1),
        //       child: Container(
        //         width: MediaQuery.of(context).size.width,
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //         decoration: BoxDecoration(
        //           color: widget.value.page == 1 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         child: Row(
        //           children: [
        //             const SizedBox(
        //               width: 16,
        //             ),
        //             Image.asset(
        //               ImageAssets.building,
        //               height: 30,
        //               color: widget.value.page == 1 ? Colors.black : Colors.white,
        //             ),
        //             const SizedBox(
        //               width: 16,
        //             ),
        //             Text(
        //               "Data Kantor",
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 color: widget.value.page == 1 ? Colors.black : Colors.white,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     // InkWell(
        //     //   onTap: () => value.gantimenu(31),
        //     //   child: Container(
        //     //     width: MediaQuery.of(context).size.width,
        //     //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     //     decoration: BoxDecoration(
        //     //       color: value.page == 31 ? Colors.white : Colors.transparent,
        //     //       borderRadius: BorderRadius.circular(8),
        //     //     ),
        //     //     child: Row(
        //     //       children: [
        //     //         SizedBox(
        //     //           width: 16,
        //     //         ),
        //     //         Image.asset(
        //     //           ImageAssets.user,
        //     //           height: 30,
        //     //           color: value.page == 31 ? Colors.black : Colors.white,
        //     //         ),
        //     //         SizedBox(
        //     //           width: 16,
        //     //         ),
        //     //         Text(
        //     //           "Data Level",
        //     //           style: TextStyle(
        //     //             fontSize: 16,
        //     //             color: value.page == 31 ? Colors.black : Colors.white,
        //     //           ),
        //     //         )
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),
        //     // InkWell(
        //     //   onTap: () => value.gantimenu(29),
        //     //   child: Container(
        //     //     width: MediaQuery.of(context).size.width,
        //     //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     //     decoration: BoxDecoration(
        //     //       color: value.page == 29 ? Colors.white : Colors.transparent,
        //     //       borderRadius: BorderRadius.circular(8),
        //     //     ),
        //     //     child: Row(
        //     //       children: [
        //     //         SizedBox(
        //     //           width: 16,
        //     //         ),
        //     //         Image.asset(
        //     //           ImageAssets.group,
        //     //           height: 30,
        //     //           color: value.page == 29 ? Colors.black : Colors.white,
        //     //         ),
        //     //         SizedBox(
        //     //           width: 16,
        //     //         ),
        //     //         Text(
        //     //           "Data Jabatan",
        //     //           style: TextStyle(
        //     //             fontSize: 16,
        //     //             color: value.page == 29 ? Colors.black : Colors.white,
        //     //           ),
        //     //         )
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),
        //     InkWell(
        //       onTap: () => widget.value.gantimenu(30),
        //       child: Container(
        //         width: MediaQuery.of(context).size.width,
        //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //         decoration: BoxDecoration(
        //           color: widget.value.page == 30 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         child: Row(
        //           children: [
        //             const SizedBox(
        //               width: 16,
        //             ),
        //             Image.asset(
        //               ImageAssets.user,
        //               height: 30,
        //               color: widget.value.page == 30 ? Colors.black : Colors.white,
        //             ),
        //             const SizedBox(
        //               width: 16,
        //             ),
        //             Text(
        //               "Data Pejabat",
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 color: widget.value.page == 30 ? Colors.black : Colors.white,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(36),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 36 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.calendar,
        //           height: 30,
        //           color: widget.value.page == 36 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Hari Kerja",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 36 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),y
        // ),
        InkWell(
          onTap: () => widget.value.gantimenu(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: widget.value.page == 1 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.building,
                  height: 30,
                  color: widget.value.page == 1 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Data Kantor",
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.value.page == 1 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(74),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 74 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 74 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Golongan Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 74 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(75),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 75 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 75 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Kelompok Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 75 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(76),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 76 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 76 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Jenis Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 76 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(77),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 77 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 77 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Kategori Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 77 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(85),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 85 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 85 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Satuan Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 85 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(78),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 78 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 78 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Status Pengiriman",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 78 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(2),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 2 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.accounting,
        //           height: 30,
        //           color: widget.value.page == 2 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Chart of Account",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 2 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // ExpansionTile(
        //     tilePadding: EdgeInsets.zero,
        //     childrenPadding: EdgeInsets.zero,
        //     shape: const Border(),
        //     expandedAlignment: Alignment.centerLeft,
        //     collapsedIconColor: Colors.white,
        //     expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        //     onExpansionChanged: (expanded) {
        //       if (expanded) {
        //         setState(() {
        //           _isExpandedSub = 2;
        //         });
        //       } else {
        //         setState(() {
        //           _isExpandedSub = 0;
        //         });
        //       }
        //     },
        //     title: Container(
        //       decoration: BoxDecoration(
        //         color: _isExpandedSub == 2 ? const Color.fromARGB(255, 0, 125, 228) : Colors.transparent,
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         children: [
        //           Image.asset(ImageAssets.trend, height: 30, color: Colors.white),
        //           const SizedBox(
        //             width: 16,
        //           ),
        //           const Text(
        //             "SBB Khusus",
        //             style: TextStyle(fontSize: 16, color: Colors.white),
        //           )
        //         ],
        //       ),
        //     ),
        //     children: [
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(47),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 47 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.list,
        //                 height: 30,
        //                 color: widget.value.page == 47 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Golongan SBB Khusus",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 47 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(37),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 37 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.list,
        //                 height: 30,
        //                 color: widget.value.page == 37 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Setup SBB Khusus",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 37 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ]),

        // ExpansionTile(
        //     tilePadding: EdgeInsets.zero,
        //     childrenPadding: EdgeInsets.zero,
        //     shape: const Border(),
        //     expandedAlignment: Alignment.centerLeft,
        //     collapsedIconColor: Colors.white,
        //     expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        //     onExpansionChanged: (expanded) {
        //       if (expanded) {
        //         setState(() {
        //           _isExpandedSub = 3;
        //         });
        //       } else {
        //         setState(() {
        //           _isExpandedSub = 0;
        //         });
        //       }
        //     },
        //     title: Container(
        //       decoration: BoxDecoration(
        //         color: _isExpandedSub == 3 ? const Color.fromARGB(255, 0, 125, 228) : Colors.transparent,
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         children: [
        //           Image.asset(ImageAssets.trend, height: 30, color: Colors.white),
        //           const SizedBox(
        //             width: 16,
        //           ),
        //           const Text(
        //             "Penyusutan",
        //             style: TextStyle(fontSize: 16, color: Colors.white),
        //           )
        //         ],
        //       ),
        //     ),
        //     children: [
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(3),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 3 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.trend,
        //                 height: 30,
        //                 color: widget.value.page == 3 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Metode Penyusutan",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 3 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(33),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 33 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.trend,
        //                 height: 30,
        //                 color: widget.value.page == 33 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Kelompok Aset",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 33 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(34),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 34 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.trend,
        //                 height: 30,
        //                 color: widget.value.page == 34 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Golongan Aset",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 34 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ]),
        // ExpansionTile(
        //     tilePadding: EdgeInsets.zero,
        //     childrenPadding: EdgeInsets.zero,
        //     shape: const Border(),
        //     expandedAlignment: Alignment.centerLeft,
        //     collapsedIconColor: Colors.white,
        //     expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        //     onExpansionChanged: (expanded) {
        //       if (expanded) {
        //         setState(() {
        //           _isExpandedSub = 4;
        //         });
        //       } else {
        //         setState(() {
        //           _isExpandedSub = 0;
        //         });
        //       }
        //     },
        //     title: Container(
        //       decoration: BoxDecoration(
        //         color: _isExpandedSub == 4 ? const Color.fromARGB(255, 0, 125, 228) : Colors.transparent,
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         children: [
        //           Image.asset(ImageAssets.setting, height: 30, color: Colors.white),
        //           const SizedBox(
        //             width: 16,
        //           ),
        //           const Text(
        //             "Transaksi",
        //             style: TextStyle(fontSize: 16, color: Colors.white),
        //           )
        //         ],
        //       ),
        //     ),
        //     children: [
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(4),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 4 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.bill,
        //                 height: 30,
        //                 color: widget.value.page == 4 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Setup Transaksi",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 4 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(32),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 32 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.bill,
        //                 height: 30,
        //                 color: widget.value.page == 32 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Pajak",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 32 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(69),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 69 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.eom,
        //                 height: 30,
        //                 color: widget.value.page == 69 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Kas Kecil",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 69 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(65),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 65 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.bill,
        //                 height: 30,
        //                 color: widget.value.page == 65 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Hutang / Piutang",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 65 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ]),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(38),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 38 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.eom,
        //           height: 30,
        //           color: widget.value.page == 38 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Back Date",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 38 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(60),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 60 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.eom,
        //           height: 30,
        //           color: widget.value.page == 60 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Level & Akses User",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 60 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(39),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 39 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.click,
        //           height: 30,
        //           color: widget.value.page == 39 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Otorisasi",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 39 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // // InkWell(
        //   onTap: () => value.gantimenu(5),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //   color: value.page ==  ? Colors.white : Colors.transparent,
        //   borderRadius: BorderRadius.circular(8),
        // ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.report,
        //           height: 30,
        //           color: value.page == 5 ? Colors.black : Colors.white,
        //         ),
        //         SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Laporan",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: value.page == 5 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class MenuMasterWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuMasterWidget({super.key, required this.value});

  @override
  State<MenuMasterWidget> createState() => _MenuMasterWidgetState();
}

class _MenuMasterWidgetState extends State<MenuMasterWidget> {
  bool _isExpanded = false;
  bool _isExpandedSub = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.setting, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "MASTER",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        InkWell(
          onTap: () => widget.value.gantimenu(79),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 79 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 79 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Master Users",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 79 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(80),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 80 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 80 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Master Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 80 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(84),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 84 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 84 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Master Barcode",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 84 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(81),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 81 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.setting,
                  height: 30,
                  color: widget.value.page == 81 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Master Movers",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 81 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(6),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 6 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.group,
        //           height: 30,
        //           color: widget.value.page == 6 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Users",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 6 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(7),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 7 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.bank,
        //           height: 30,
        //           color: widget.value.page == 7 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Bank",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 7 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        // InkWell(
        //   onTap: () => widget.value.gantimenu(35),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 35 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.group,
        //           height: 30,
        //           color: widget.value.page == 35 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "AO / Marketing",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 35 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: () => widget.value.gantimenu(9),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //       color: widget.value.page == 9 ? Colors.white : Colors.transparent,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.click,
        //           height: 30,
        //           color: widget.value.page == 9 ? Colors.black : Colors.white,
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Otorisasi",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: widget.value.page == 9 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // ExpansionTile(
        //     tilePadding: EdgeInsets.zero,
        //     childrenPadding: EdgeInsets.zero,
        //     shape: const Border(),
        //     expandedAlignment: Alignment.centerLeft,
        //     collapsedIconColor: Colors.white,
        //     expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        //     onExpansionChanged: (expanded) {
        //       setState(() {
        //         _isExpandedSub = expanded;
        //       });
        //     },
        //     title: Container(
        //       decoration: BoxDecoration(
        //         color: _isExpandedSub ? const Color.fromARGB(255, 0, 125, 228) : Colors.transparent,
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Row(
        //         children: [
        //           Image.asset(ImageAssets.trend, height: 30, color: Colors.white),
        //           const SizedBox(
        //             width: 16,
        //           ),
        //           const Text(
        //             "Terminal Akses",
        //             style: TextStyle(fontSize: 16, color: Colors.white),
        //           )
        //         ],
        //       ),
        //     ),
        //     children: [
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(66),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 66 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.wifi,
        //                 height: 30,
        //                 color: widget.value.page == 66 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "Akses Point",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 66 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () => widget.value.gantimenu(68),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //           decoration: BoxDecoration(
        //             color: widget.value.page == 68 ? Colors.white : Colors.transparent,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             children: [
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Image.asset(
        //                 ImageAssets.userwifi,
        //                 height: 30,
        //                 color: widget.value.page == 68 ? Colors.black : Colors.white,
        //               ),
        //               const SizedBox(
        //                 width: 16,
        //               ),
        //               Text(
        //                 "User Akses Point",
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                   color: widget.value.page == 68 ? Colors.black : Colors.white,
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ]),
        // // InkWell(
        //   onTap: () => value.gantimenu(10),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //   color: value.page ==  ? Colors.white : Colors.transparent,
        //   borderRadius: BorderRadius.circular(8),
        // ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.report,
        //           height: 30,
        //           color: value.page == 10 ? Colors.black : Colors.white,
        //         ),
        //         SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Laporan",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: value.page == 10 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class MenuInventarisWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuInventarisWidget({super.key, required this.value});

  @override
  State<MenuInventarisWidget> createState() => _MenuInventarisWidgetState();
}

class _MenuInventarisWidgetState extends State<MenuInventarisWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.prices, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "INVENTARIS",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        InkWell(
          onTap: () => widget.value.gantimenu(11),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 11 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.cart,
                  height: 30,
                  color: widget.value.page == 11 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Pengadaan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 11 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 12 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.placement,
                  height: 30,
                  color: widget.value.page == 12 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Penempatan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 12 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(13),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 13 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.audit,
                  height: 30,
                  color: widget.value.page == 13 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Revaluasi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 13 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(14),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 14 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.carts,
                  height: 30,
                  color: widget.value.page == 14 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Jual/Hapus",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 14 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 15 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.click,
                  height: 30,
                  color: widget.value.page == 15 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Otorisasi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 15 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        // InkWell(
        //   onTap: () => value.gantimenu(16),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //     decoration: BoxDecoration(
        //   color: value.page ==  ? Colors.white : Colors.transparent,
        //   borderRadius: BorderRadius.circular(8),
        // ),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           ImageAssets.report,
        //           height: 30,
        //           color: value.page == 16 ? Colors.black : Colors.white,
        //         ),
        //         SizedBox(
        //           width: 16,
        //         ),
        //         Text(
        //           "Laporan",
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: value.page == 16 ? Colors.black : Colors.white,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class MenuHutangPiutangWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuHutangPiutangWidget({super.key, required this.value});

  @override
  State<MenuHutangPiutangWidget> createState() =>
      _MenuHutangPiutangWidgetState();
}

class _MenuHutangPiutangWidgetState extends State<MenuHutangPiutangWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.bill, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "KELOLA HUTANG/ PIUTANG",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        InkWell(
          onTap: () => widget.value.gantimenu(8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: widget.value.page == 8 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.user,
                  height: 30,
                  color: widget.value.page == 8 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Customer/Supplier",
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.value.page == 8 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(61),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 61 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.rupiahs,
                  height: 30,
                  color: widget.value.page == 61 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Hutang / Piutang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 61 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(71),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 71 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.rupiahs,
                  height: 30,
                  color: widget.value.page == 71 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Laporan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 71 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuTransaksiWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuTransaksiWidget({super.key, required this.value});

  @override
  State<MenuTransaksiWidget> createState() => _MenuTransaksiWidgetState();
}

class _MenuTransaksiWidgetState extends State<MenuTransaksiWidget> {
  bool _isExpanded = false;
  int _isExpandedSub = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.bill, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "TRANSAKSI",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        InkWell(
          onTap: () => widget.value.gantimenu(72),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 72 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 72 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Penerimaan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 72 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(73),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 73 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 73 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Pengeluaran",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 73 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(86),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 86 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 86 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Koreksi Barang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 86 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(83),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 83 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 83 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Tracking Pengiriman",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 83 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(17),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 17 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 17 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Satu Transaksi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 17 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(18),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 18 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 18 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Banyak Transaksi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 18 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(67),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 67 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 67 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Pembatalan Transaksi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 67 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(57),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 57 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 57 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Penyelesian Perantara",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 57 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(58),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 58 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.debt,
                  height: 30,
                  color: widget.value.page == 58 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Bayar Hutang/ Piutang",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 58 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(59),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 59 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.rupiahs,
                  height: 30,
                  color: widget.value.page == 59 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Bayar/Pendapatan dimuka",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 59 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            shape: const Border(),
            expandedAlignment: Alignment.centerLeft,
            collapsedIconColor: Colors.white,
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            onExpansionChanged: (expanded) {
              if (expanded) {
                setState(() {
                  _isExpandedSub = 1;
                });
              } else {
                setState(() {
                  _isExpandedSub = 0;
                });
              }
            },
            title: Container(
              decoration: BoxDecoration(
                color: _isExpandedSub == 1
                    ? const Color.fromARGB(255, 0, 125, 228)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(ImageAssets.rupiah,
                      height: 30, color: Colors.white),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Kas Kecil",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
            children: [
              InkWell(
                onTap: () => widget.value.gantimenu(19),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 19
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 19
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Pengeluran/Pemasukan",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 19
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(62),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 62
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 62
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Kas Bon",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 62
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(70),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 70
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 70
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Laporan Kas Kecil",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 70
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () => widget.value.gantimenu(63),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              //     decoration: BoxDecoration(
              //       color: widget.value.page == 63 ? Colors.white : Colors.transparent,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Image.asset(
              //           ImageAssets.report,
              //           height: 30,
              //           color: widget.value.page == 63 ? Colors.black : Colors.white,
              //         ),
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Text(
              //           "Penyelesaian Kas Bon",
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: widget.value.page == 63 ? Colors.black : Colors.white,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ]),
        InkWell(
          onTap: () => widget.value.gantimenu(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 20 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.bank,
                  height: 30,
                  color: widget.value.page == 20 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Saldo Bank",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 20 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            shape: const Border(),
            expandedAlignment: Alignment.centerLeft,
            collapsedIconColor: Colors.white,
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            onExpansionChanged: (expanded) {
              if (expanded) {
                setState(() {
                  _isExpandedSub = 2;
                });
              } else {
                setState(() {
                  _isExpandedSub = 0;
                });
              }
            },
            title: Container(
              decoration: BoxDecoration(
                color: _isExpandedSub == 2
                    ? const Color.fromARGB(255, 0, 125, 228)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.bill,
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Rekonsiliasi Harian",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            children: [
              InkWell(
                onTap: () => widget.value.gantimenu(54),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 54
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 54
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Transaksi",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 54
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 50
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 50
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Bank",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 50
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(55),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 55
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 55
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Perantara Aktiva/Pasiva",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 55
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(51),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 51
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 51
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Hutang/Piutang",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 51
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () => value.gantimenu(52),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              //     decoration: BoxDecoration(
              //   color: value.page ==  ? Colors.white : Colors.transparent,
              //   borderRadius: BorderRadius.circular(8),
              // ),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Image.asset(
              //           ImageAssets.report,
              //           height: 30,
              //           color: value.page == 52 ? Colors.black : Colors.white,
              //         ),
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Text(
              //           "Piutang",
              //           style: TextStyle(
              //             fontSize: 16,
              //             color:
              //                 value.page == 52 ? Colors.black : Colors.white,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () => widget.value.gantimenu(53),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 53
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 53
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Aset",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 53
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
        InkWell(
          onTap: () => widget.value.gantimenu(24),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 24 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.click,
                  height: 30,
                  color: widget.value.page == 24 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Otorisasi",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 24 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            shape: const Border(),
            expandedAlignment: Alignment.centerLeft,
            collapsedIconColor: Colors.white,
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            onExpansionChanged: (expanded) {
              if (expanded) {
                setState(() {
                  _isExpandedSub = 3;
                });
              } else {
                setState(() {
                  _isExpandedSub = 0;
                });
              }
            },
            title: Container(
              decoration: BoxDecoration(
                color: _isExpandedSub == 3
                    ? const Color.fromARGB(255, 0, 125, 228)
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.report,
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Laporan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            children: [
              InkWell(
                onTap: () => widget.value.gantimenu(43),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 43
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 43
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Jurnal",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 43
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => widget.value.gantimenu(25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: widget.value.page == 25
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        ImageAssets.report,
                        height: 30,
                        color: widget.value.page == 25
                            ? Colors.black
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Transaksi",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.value.page == 25
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () => widget.value.gantimenu(41),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              //     decoration: BoxDecoration(
              //       color: widget.value.page == 41
              //           ? Colors.white
              //           : Colors.transparent,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Image.asset(
              //           ImageAssets.report,
              //           height: 30,
              //           color: widget.value.page == 41
              //               ? Colors.black
              //               : Colors.white,
              //         ),
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Text(
              //           "Banyak Transaksi",
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: widget.value.page == 41
              //                 ? Colors.black
              //                 : Colors.white,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () => widget.value.gantimenu(42),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              //     decoration: BoxDecoration(
              //       color: widget.value.page == 42
              //           ? Colors.white
              //           : Colors.transparent,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Image.asset(
              //           ImageAssets.report,
              //           height: 30,
              //           color: widget.value.page == 42
              //               ? Colors.black
              //               : Colors.white,
              //         ),
              //         SizedBox(
              //           width: 16,
              //         ),
              //         Text(
              //           "Back date",
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: widget.value.page == 42
              //                 ? Colors.black
              //                 : Colors.white,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ]),
      ],
    );
  }
}

class MenuLaporanWidget extends StatefulWidget {
  final MenuNotifier value;
  const MenuLaporanWidget({super.key, required this.value});

  @override
  State<MenuLaporanWidget> createState() => _MenuLaporanWidgetState();
}

class _MenuLaporanWidgetState extends State<MenuLaporanWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expandedAlignment: Alignment.centerLeft,
      collapsedIconColor: Colors.white,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        decoration: BoxDecoration(
          color: _isExpanded
              ? const Color.fromARGB(255, 0, 125, 228)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.eom, height: 30, color: Colors.white),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "LAPORAN",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
      children: [
        InkWell(
          onTap: () => widget.value.gantimenu(44),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 44 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 44 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Neraca Berjalan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 44 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(46),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 46 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 46 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Laba Rugi Berjalan",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 46 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(45),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 45 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 45 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Neraca Periode",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 45 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(49),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 49 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 49 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Laba Rugi Periode",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 49 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.value.gantimenu(48),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color:
                  widget.value.page == 48 ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  ImageAssets.report,
                  height: 30,
                  color: widget.value.page == 48 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "GL / COA",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        widget.value.page == 48 ? Colors.black : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
