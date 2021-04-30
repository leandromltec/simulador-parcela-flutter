import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/equipment_list.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class EquipmentListScreen extends StatefulWidget {
  @override
  _EquipmentListScreenState createState() => _EquipmentListScreenState();
}

class _EquipmentListScreenState extends State<EquipmentListScreen> {
  Widget buildButtomSheet(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton.icon(
            label: Text("Fechar"),
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          titlePage("Equipamentos"),
          dividerSession(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  )),
              child: Stack(
                children: [
                  EquipmentList(),
                  Positioned(
                    right: 0.0,
                    bottom: 230,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 180,
                      child: FloatingActionButton.extended(
                          elevation: 3,
                          label: Text(
                            "Incluir equipamento",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          icon: Icon(
                            Icons.add,
                            size: 25,
                          ),
                          backgroundColor: colorBackgroundElevatedButtonApp,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context, builder: buildButtomSheet);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}