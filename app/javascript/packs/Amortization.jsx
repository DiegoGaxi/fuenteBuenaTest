import React from "react";
import { formatNumero } from "./helper.jsx";

function Amortization({ loan }) {
  return (
    <>
      <h1> Amortizacion </h1>
      <table className="tabla">
        <thead>
          <tr>
            <th>Periodo</th>
            <th>Pago Capital</th>
            <th>Interes</th>
            <th>Monto Pago</th>
            <th>Saldo Insoluto</th>
            <th>Fecha</th>
          </tr>
        </thead>
        <tbody>
          {loan?.amortizacion?.map((item, index) => (
            <tr key={index}>
              <td>{item.no_pago}</td>
              <td>{formatNumero(parseFloat(item.pago_capital), "$")}</td>
              <td>{formatNumero(parseFloat(item.interes), "$")}</td>
              <td>
                {formatNumero(parseFloat(item.pago_capital_con_intereses), "$")}
              </td>
              <td>{formatNumero(parseFloat(item.saldo_insoluto), "$")}</td>
              <td>{item.fecha}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default Amortization;
