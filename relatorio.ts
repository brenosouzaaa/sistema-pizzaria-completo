import { db } from './ts/db';
import fs from "fs";
import path from "path";

export async function gerarRelatorioPedido(pedidoId: string) {
  try {
    // Buscar pedido
    const pedido = await db.query(
      "SELECT * FROM pedidos WHERE id=$1",
      [pedidoId]
    );

    // Buscar itens do pedido
    const itens = await db.query(
      "SELECT * FROM itens_pedido WHERE pedido_id=$1",
      [pedidoId]
    );

    const p = pedido.rows[0];

    let texto = `RELATÓRIO DO PEDIDO\n`;
    texto += `=====================\n`;
    texto += `ID: ${p.id}\n`;
    texto += `Cliente: ${p.cliente_nome ?? "Não informado"}\n`;
    texto += `Total: R$ ${p.total}\n`;
    texto += `Forma de pagamento: ${p.forma_pagamento}\n`;
    texto += `Data: ${p.data_iso}\n\n`;

    texto += `ITENS:\n`;

    for (const item of itens.rows) {
      texto += `- ${item.nome} | Qtd: ${item.quantidade} | Preço: R$ ${item.preco_unit}\n`;
    }

    // Caminho onde o relatório será salvo
    const filePath = path.join(
      __dirname,
      "relatorios",
      `pedido_${p.id}.txt`
    );

    // Criar pasta /relatorios caso não exista
    fs.mkdirSync(path.dirname(filePath), { recursive: true });

    // Salvar relatório
    fs.writeFileSync(filePath, texto);

    console.log("Relatório gerado:", filePath);
    return `pedido_${p.id}.txt`;

  } catch (err) {
    console.error("ERRO ao gerar relatório:", err);
  }
}
