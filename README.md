# clean_arch

Clean_arch {

- Proposta para uma arquitetura mais limpa;
- Fortemente ligado ao S.O.L.I.D e outras boas práticas, acrônimo para Single
  responsability => Uma class deve ter um, e somente um, motivo para ser modificado;

      open close => Uma class que adiciona comportamento a outra class sem modificar a class adicionada,

      liskcov substitution => Uma class extendida deve substituir a class que extende,

      interface segregation => Inteface deve ser um único motivo para ser modificada e

      dependency inversion => depender de inteface não de implementação.

- Arquitetura limpa é um conjunto de designer pattern que respeita princípios da programação como o solid;
- Com isso tudo, podemos então reconhece que dividir a aplicação em camadas como domain é coração da aplicação aonde está regra de negócio comporativa (uma entities anémica com somente a regra de negócio base), infra e external é algo a ser considerado
  }
