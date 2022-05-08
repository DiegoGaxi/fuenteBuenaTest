import React from "react";
import style from "../styles/Amortization.module.css";
import {
  fecha_hoy,
  fecha_dia_anterior,
  formatDate,
  formatNumero,
} from "./helper.jsx";

import { useEffect, useState } from "react";

function Amortization({ loan }) {
  const [amortization, setAmortization] = useState([]);

  useEffect(() => {
    fetch("/crear_loan")
      .then((res) => res.json())
      .then((data) => {
        setAmortization(data);
      });
  }, []);

  return (
    <>
      <h1> Amortizacion </h1>
      <table className={style.tabla}>
        <thead>
          <tr>
            <th>No.Pago</th>
            <th>Fecha</th>
            <th>Interes</th>
            <th>Pago Capital</th>
            <th>Pago Capital Con Interes</th>
            <th>Saldo Insoluto</th>
          </tr>
        </thead>
        <tbody>
          {amortization.map((item, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{item.fecha}</td>
              <td>{item.interes}</td>
              <td>{item.pago_capital}</td>
              <td>{item.pago_capital_con_interes}</td>
              <td>{item.saldo_insoluto}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default Amortization;
