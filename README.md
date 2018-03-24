Enunciado:

Seu cliente é um blogueiro aficcionado por tecnologia, ele tinha um blog muito visitado porém este blog foi hackeado e o código fonte foi apagado. Para o ressurgimento deste blog, este blogueiro teve a grande idéia de fazer todos os seus posts utilizando o formato Markdown(https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet), sendo assim ele precisa de um formulário onde ele pode preencher o título e o texto geral. Ele também deseja que a página inicial contenha a listagem das postagens e que seja possível visualizar essas postagens no formato final (já convertidos de markdown para html).
O blogueiro aguarda ansiosamente pela primeira versão desse produto.

Desafio: O blogueiro deve conseguir fazer posts em markdown.

Critério de aceitação:
DADO QUE eu sou um blogueiro
QUANDO eu acesso a página para criar uma postagem
E crio uma postagem no formato markdown
ENTÃO eu devo ter um link para o post final no formato html

DADO QUE eu sou um blogueiro
QUANDO eu crio um post
OU QUANDO eu edito post
ENTÃO eu devo ver em tempo real como as mudanças que eu fiz serão aplicadas (WYSIWYG)

O que é esperado:
- Implementar um processador assíncrono utilizando o Sidekiq (https://github.com/mperham/Sidekiq). Esse processo deve fazer a conversão de markdown para html;
- Uma página com a listagem das postagens;
- Uma página para criação das postagens;
- Uma página para visualização das postagens já convertidas;
- Testes automatizados com Rspec3;
- Implementar WYSIWYG dentro da página que cria e edita a postagem;
- Utilizar o Ruby On Rails;
- Versionar utilizando Git (https://git-scm.com/)

Dicas (opcionais):
- Você pode utilizar qualquer biblioteca/gem que achar relevante para esse projeto, por exemplo: Se você não quer fazer uma conversão de markdown manualmente, pode utilizar a RedCarpet (https://github.com/vmg/redcarpet) para fazer essa conversão por você;

Utilize sua criatividade para mostrar que suas habilidades vão além do básico:
- Implementar uma ferramenta de autenticação, assim os posts não ficam sem um dono;
- Fazer testes de integração usando ferramentas especializadas;
- Caprichar na estilização da página;
- Nos surpreender com alguma implementação que melhore o fluxo para o usuário;
