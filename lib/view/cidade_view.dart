import 'package:flutter/material.dart';
import '../presenter/cidade_presenter.dart';
import '../model/cidade.dart';

// Contrato que define o que a view de cadastro de cidades deve implementar
abstract class CidadeViewContract {
  void aoAdicionarCidade(Cidade cidade);
}

class CidadeView extends StatefulWidget {
  @override
  _CidadeViewState createState() => _CidadeViewState();
}

class _CidadeViewState extends State<CidadeView> implements CidadeViewContract {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  late CidadePresenter _presenter;

  final List<Cidade> _cidades = [];

  @override
  void initState() {
    super.initState();
    _presenter = CidadePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: _ufController,
              decoration: InputDecoration(labelText: 'UF'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _regionController,
              decoration: InputDecoration(labelText: 'Região'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int id = int.parse(_idController.text);
                String uf = _ufController.text;
                String nome = _nameController.text;
                String regiao = _regionController.text;

                _presenter.adicionarCidade(id, uf, nome, regiao);
              },
              child: Text('Cadastrar Cidade'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cidades.length,
                itemBuilder: (context, index) {
                  Cidade cidade = _cidades[index];
                  return ListTile(
                    title: Text('${cidade.nome} - ${cidade.uf}'),
                    subtitle: Text(cidade.regiao),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Atualiza a lista de cidades quando uma nova cidade é adicionada
  @override
  void aoAdicionarCidade(Cidade cidade) {
    setState(() {
      _cidades.add(cidade);
    });
  }
}
