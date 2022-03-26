/* ALIAS: Dbase */
SELECT DISTINCT OS.Cod_Os, OS.Cod_cli, OS.Equipamento, OS.Fabricante, OS.Modelo, OS.Serie, OS.Ativo, OS.Data, OS.Defeito_Cliente, OS.Diagnostico, OS.Status, OS.Orcamento, OS.Saida, OS.Obs, OS.Solucao, Clientes.Cod_cli, Clientes.Cliente, Clientes.Endereco, Clientes.Bairro, Clientes.Cidade, Clientes.Telefone, Clientes.Cep, Clientes.Cnpj, Clientes.Ie, Clientes.Contato, Clientes.Email, Clientes.Roteiro
FROM OS
   INNER JOIN "Clientes.db" Clientes
   ON  (Clientes.Cod_cli = OS.Cod_cli)  
ORDER BY OS.Cod_Os
