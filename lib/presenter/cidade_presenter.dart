import '../model/cidade.dart';
import '../view/cidade_view.dart';

class CidadePresenter {
  final CidadeViewContract view;
  List<Cidade> cidades = [];

  CidadePresenter(this.view);

  void adicionarCidade(int id, String uf, String nome, String regiao) {
    // Simulação de cadastro de uma cidade
    Cidade cidade = Cidade(id: id, uf: uf, nome: nome, regiao: regiao);
    cidades.add(cidade);
    view.aoAdicionarCidade(cidade);
  }

  List<Cidade> retornaCidades() {
    return cidades;
  }
}
